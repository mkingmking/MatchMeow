import firebase_admin
from firebase_admin import credentials, db
import pandas as pd




# Firebase projesine bağlanmak için
#cred = credentials.Certificate('C:\proje1\android\app\google-services.json')
cred = credentials.Certificate('matchmeow-aebe7-firebase-adminsdk-xyr5f-ecd0ff3457.json')

firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://matchmeow-aebe7-default-rtdb.europe-west1.firebasedatabase.app/'
})


ref = db.reference('evcilHayvanlar')
data = ref.get()

# Verileri DataFrame'e dönüştürme
df = pd.DataFrame(data)


rows = []
keys = []
for key, value in data.items():
    keys.append(key)
    rows.append(value)  # 'value' is the nested JSON object

# Create a DataFrame with keys as the index
df = pd.DataFrame(rows, index=keys)


# legacy code do not touch
#######################






def recommend_based_on_preferences(preferences, df):
    filtered_df = df
    for key, value in preferences.items():
        filtered_df = filtered_df[filtered_df[key] == value]

    # Assuming the hash values are the indices of the DataFrame
    recommended_pet_hashes = filtered_df.index.tolist()
    print(filtered_df.index)
    return recommended_pet_hashes



def update_user_with_recommendations(user_id, pet_hashes):
    """
    Update the specified user's record in the Firebase Realtime Database 
    with the recommended pet hash values.

    :param user_id: The unique identifier of the user.
    :param pet_hashes: A list of pet hash values recommended for the user.
    """
    # Reference to the user's data in the database
    user_ref = db.reference(f'users/{user_id}')

    # Update the user's data with the recommended pet hashes
    user_ref.update({
        'petHashes': pet_hashes
    })

    print(f"Updated user {user_id} with recommended pets.")

user_preferences = {
    "cinsiyet": "Dişi",
    "renk": "Beyaz ve Gri"
}









recommendations = recommend_based_on_preferences(user_preferences, df)
print(recommendations)


# Example user ID and recommended pet hashes
user_id = '-NlmXg0BuNn4s67r8qrM'


# Update the user's data in Firebase
update_user_with_recommendations(user_id, recommendations)


