import 'UserAdress.dart';

class User {
  String name;
  String surname;
  String email;
  String sex;
  int age;
  UserAddress address;
  String userID;

  User({
    required this.name,
    required this.surname,
    required this.email,
    required this.sex,
    required this.age,
    required this.address,
    required this.userID,
  });

  // Factory method to create User from a Map (database data)
  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      sex: json['sex'],
      age: json['age'],
      address: json['address'] != null
          ? UserAddress.fromJson(json['address'])
          : UserAddress(
              street: '',
              city: '',
              state: '',
              postalCode: '',
            ), // Assuming UserAddress has an empty constructor
      userID: json['userID'],
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
    };
  }
}
