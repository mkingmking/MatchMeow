import sys
import numpy as np
import pandas as pd
from firebase_admin import credentials, db, initialize_app
from sklearn.metrics.pairwise import cosine_similarity
import json


# Kullanıcıdan user_id'yi al
if len(sys.argv) > 1:
    user_id = sys.argv[1]
else:
    sys.exit(1)

# Firebase projesine bağlanmak için
cred = credentials.Certificate('matchmeow-aebe7-firebase-adminsdk-xyr5f-ecd0ff3457.json')
initialize_app(cred, {
    'databaseURL': 'https://matchmeow-aebe7-default-rtdb.europe-west1.firebasedatabase.app/'
})

# 'users' tablosunu alın
users_ref = db.reference('users')
users_data = users_ref.get()
users_df = pd.DataFrame(users_data)

# 'evcilHayvanlar' tablosunu alın
pets_ref = db.reference('evcilHayvanlar')
pets_data = pets_ref.get()
pets_df = pd.DataFrame(pets_data)

# Sütun adlarını düzeltme: Sütun adlarını kullanıcı kimlikleri (user_id) ile güncelleme
users_df = users_df.rename(columns=lambda x: users_df[x]['user_id'] if 'user_id' in users_df[x] else x)

# Kullanıcılar ve evcil hayvanlar arasında ilişki matrisini oluşturma
user_pet_matrix = pd.DataFrame(0, index=users_df.columns, columns=pets_df.columns)

for user_column in users_df.columns:
    if 'petHashes' in users_df[user_column]:
        liked_pets = users_df[user_column]['petHashes']
        
        # `liked_pets` iterable değilse, sadece bir öğe içeriyorsa listeye çevir
        if not isinstance(liked_pets, (list, dict)):
            liked_pets = [liked_pets]
        
        for liked_pet in liked_pets:
            if liked_pet in user_pet_matrix.columns:
                user_pet_matrix.at[user_column, liked_pet] = 1



def item_based_collaborative_filtering(matrix, user_id, top_n=5):
    # Belirtilen kullanıcının tercih ettiği ürünleri filtrele
    user_preferences = matrix.loc[user_id, :]

    # Eğer kullanıcının tercih ettiği ürünlerin tüm değerleri 0 ise, rastgele bir ürün öner
    if user_preferences.sum() == 0:
        return np.random.choice(matrix.columns.to_list(), top_n, replace=False)

    # NaN değerleri sıfırlarla doldur
    matrix = matrix.fillna(0)

    # Kosinüs benzerliği hesapla
    similarity_matrix = cosine_similarity(matrix.T)

    # Kullanıcının tercih ettiği ürünlerin benzerlik puanlarını topla
    user_similarities = pd.Series(similarity_matrix.dot(user_preferences), index=matrix.columns)

    # Kullanıcının tercih ettiği ürünleri çıkar
    user_similarities = user_similarities.drop(user_preferences.index)

    # Benzerlik puanlarına göre sırala ve en iyi N ürünü seç
    top_items = user_similarities.nlargest(top_n)

    return top_items.index

def update_user_with_recommendations(user_id, recommendation_hashes):
    """
    Update the specified user's record in the Firebase Realtime Database 
    with the recommended pet hash values.

    :param user_id: The unique identifier of the user.
    :param recommendation_hashes: A list of pet hash values recommended for the user.
    """
    # Reference to the user's data in the database
    user_ref = db.reference(f'users/{user_id}')

    # Get the current user data
    user_data = user_ref.get()

    # Check if the user_data dictionary has the 'Recommendation_hashes' key
    if 'Recommendation_hashes' not in user_data:
        # If not, create the key with the specified value
        user_data['Recommendation_hashes'] = recommendation_hashes.tolist()  # Convert to Python list
    else:
        # If exists, update the existing value, avoiding duplicates
        existing_hashes = set(user_data['Recommendation_hashes'])
        new_hashes = set(recommendation_hashes.tolist())
        unique_hashes = list(new_hashes - existing_hashes)
        user_data['Recommendation_hashes'].extend(unique_hashes)

    # Update the user's data in the database
    user_ref.update(user_data)


# user_pet_matrix: Kullanıcı ve ürünlerin olduğu DataFrame
# user_id: Tavsiye istenen kullanıcının ID'si
top_items = item_based_collaborative_filtering(user_pet_matrix, user_id, top_n=5)
update_user_with_recommendations(user_id, top_items)