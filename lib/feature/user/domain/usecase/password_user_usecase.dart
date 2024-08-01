
import '../../data/models/password_models.dart';
import '../repository/user_repository.dart';

class UpdatePasswrodUseCase {
  final UserRepository userRepository;
  UpdatePasswrodUseCase(this.userRepository);

  Future<void> execute(PasswordModels passwordModels) async {
    try {
      await userRepository.updatepassword(passwordModels);

    } catch (e,stackTrace) {
      print('Error during user registration: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }
  }

}