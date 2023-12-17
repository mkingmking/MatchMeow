import 'UserAdress.dart';

class User {
  String name;
  String surname;
  String email;
  String sex;
  int age;
  UserAddress address;
  String userID;
  List<String>
      petHashes; // Existing field for storing recommended pet hash values
  List<String>
      swipedRight; // New field for storing swiped right pet hash values

  User({
    required this.name,
    required this.surname,
    required this.email,
    required this.sex,
    required this.age,
    required this.address,
    required this.userID,
    List<String>? petHashes, // Existing optional field
    List<String>? swipedRight, // New optional field
  })  : petHashes = petHashes ?? [], // Default to an empty list if null
        swipedRight = swipedRight ?? []; // Default to an empty list if null

// Factory method to create User from a Map (database data)
  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      name: json['name'] ?? 'Default Name', // Provide a default value if null
      surname: json['surname'] ??
          'Default Surname', // Provide a default value if null
      email: json['email'] ??
          'default@email.com', // Provide a default value if null
      sex: json['sex'] ?? 'Unknown', // Provide a default value if null
      age: json['age'] ?? 0, // Default to 0 if null
      address: json['address'] != null
          ? UserAddress.fromJson(json['address'])
          : UserAddress(
              street: '',
              city: '',
              state: '',
              postalCode: '',
            ), // Assuming UserAddress has an empty constructor
      userID:
          json['userID'] ?? 'defaultUserID', // Provide a default value if null
      petHashes:
          json['petHashes']?.cast<String>() ?? [], // Handle potential null
      swipedRight:
          json['swipedRight']?.cast<String>() ?? [], // Handle potential null
    );
  }

  // Convert User object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'sex': sex,
      'age': age,
      'userID': userID,
      'address': address.toJson(),
      'petHashes': petHashes, // Existing field
      'swipedRight': swipedRight, // New field
    };
  }

// Method to add a pet hash to the swipedRight list
  void addPetToSwipedRight(String petHash) {
    // Check if the petHash is already in the list to avoid duplicates
    if (!swipedRight.contains(petHash)) {
      swipedRight.add(petHash);
    }
  }
}
