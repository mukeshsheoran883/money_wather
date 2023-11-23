class User {
  String? name;
  String? address;
  String email;
  String password;
  String? dateOfBath;

  User(
      {this.name,
      required this.email,
      required this.password,
      this.address,
      this.dateOfBath});
}
