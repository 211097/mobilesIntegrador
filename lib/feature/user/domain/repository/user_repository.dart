import 'package:sazzon/feature/user/data/models/user_models.dart';

import '../../data/models/password_models.dart';
import '../entities/updatepassword.dart';

abstract class UserRepository {
  Future<void> registerUser(userModel userModel);

  Future<void> updatepassword(PasswordModels passwordModels);

  Future<void> updateUser(userModel userModel);


}