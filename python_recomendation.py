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


print(df)

def recommend_based_on_preferences(preferences):
    filtered_df = df
    for key, value in preferences.items():
        filtered_df = filtered_df[filtered_df[key] == value]
    return filtered_df


user_preferences = {
    "cinsiyet": "Dişi",
    "renk": "Beyaz ve Gri"
}



# Assuming 'data' is your raw data loaded from Firebase
# Convert each nested object into a row in the DataFrame
rows = []
for entry in data.values():
    rows.append(entry)  # 'entry' should be the nested JSON object

# Create a DataFrame
df = pd.DataFrame(rows)

# Now check the columns
print(df.columns)




recommendations = recommend_based_on_preferences(user_preferences)
print(recommendations)


