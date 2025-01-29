class MyUser {
  static const String collectionName = "users";
  String id;
  String firstName;
  String lastName;
  String username;
  String email;

  MyUser(
      {
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
  });

  MyUser.fromJson(Map<String,dynamic>json):this
      (
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'],
    );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': email,
    };
  }
}
