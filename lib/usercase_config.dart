import 'package:sazzon/feature/user/data/datasource/user_api_data_source.dart';
import 'package:sazzon/feature/user/data/repositories/user_repository_implement.dart';
import 'package:sazzon/feature/user/domain/usecase/register_user_usecase.dart';

import 'feature/user/domain/usecase/password_user_usecase.dart';

class UsercaseConfig {
  UserApiDataSourceImp? userApiDataSourceImp;
  UserRepositoryImp? userRepositoryImp;
  RegisterUserUseCase? registerUserUseCase;
  UpdatePasswrodUseCase? updatePasswrodUseCase;
  UsercaseConfig() {
    userApiDataSourceImp = UserApiDataSourceImp();
    userRepositoryImp =
        UserRepositoryImp(userApiDataSource: userApiDataSourceImp!);
    registerUserUseCase = RegisterUserUseCase(userRepositoryImp!);
    updatePasswrodUseCase = UpdatePasswrodUseCase(userRepositoryImp!);
  }
}
