class UserAddress {
  String street;
  String city;
  String state;
  String postalCode;

  UserAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
  });

  // Factory method to create UserAddress from a Map (database data)
  factory UserAddress.fromJson(Map<dynamic, dynamic> json) {
    return UserAddress(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
    );
  }

  // Convert UserAddress object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
    };
  }
}
