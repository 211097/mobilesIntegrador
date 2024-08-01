
import 'package:sazzon/feature/user/data/datasource/user_api_data_source.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:sazzon/feature/user/domain/entities/updatepassword.dart';
import 'package:sazzon/feature/user/domain/repository/user_repository.dart';

import '../models/password_models.dart';

class UserRepositoryImp implements UserRepository {
  final UserApiDataSource userApiDataSource;

  UserRepositoryImp({required this.userApiDataSource});

  @override
  Future<void> updateUser(userModel userModel) async {
    await userApiDataSource.updateUser(userModel);
  }

  @override
  Future<void> registerUser(userModel userModel) async {
    await userApiDataSource.registerUser(userModel);
  }

  @override
  Future<void> updatepassword(PasswordModels passwordModels) async {
    await userApiDataSource.updatepassword(passwordModels);
  }
}
