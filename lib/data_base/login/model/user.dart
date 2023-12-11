class UserModel {
  String? name;
  String? address;
  String email;
  String password;
  String? dateOfBath;

  UserModel(
      {this.name,
      required this.email,
      required this.password,
      this.address,
      this.dateOfBath});
}
