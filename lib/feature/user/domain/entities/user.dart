class User {
   int? id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String admin;

  User({
     this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.admin

  });
}