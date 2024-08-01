import 'package:sazzon/feature/user/domain/entities/updatepassword.dart';

class PasswordModels extends Updatepassword {
  PasswordModels({
    String? id,
    required String password,
  }) : super(
          id: id,
          password: password,
        );

  factory PasswordModels.fromJson(Map<String, dynamic> json) {
    return PasswordModels(
      id: json['id'],
      password: json['password']);
  }

  factory PasswordModels.fromEntity(Updatepassword updatepassword) {
    return PasswordModels(
      id:updatepassword.id,
      password: updatepassword.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'password': password,
    };
  }
}
