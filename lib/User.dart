class User {
  String name;
  String surname;
  String email;
  String sex;
  int age;

  User({
    required this.name,
    required this.surname,
    required this.email,
    required this.sex,
    required this.age,
  });

  // Factory method to create User from a Map (database data)
  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      sex: json['sex'],
      age: json['age'],
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
    };
  }
}
