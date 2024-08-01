import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:sazzon/feature/user/domain/repository/user_repository.dart';



class UpdateUserUseCase {
  final UserRepository userRepository;
  UpdateUserUseCase(this.userRepository);

  Future<void> execute(userModel userModel,

  ) async {
    try {
      await userRepository.updateUser(userModel);

    } catch (e,stackTrace) {
      print('Error during user registration: $e');
      print('StackTrace: $stackTrace');
      rethrow;
    }
  }

}