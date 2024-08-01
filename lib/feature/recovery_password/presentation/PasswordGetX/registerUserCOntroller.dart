import 'package:get/get.dart';
import 'package:sazzon/feature/user/domain/usecase/password_user_usecase.dart';

import 'password_event.dart';
import 'password_state.dart';


class PasswordController extends GetxController {
  final UpdatePasswrodUseCase updatePasswrodUseCase;
  var state = Rx<CreatePostState>(PasswordInitial());
  PasswordController({required this.updatePasswrodUseCase});
  createPasswrod(CreatepasswrodEvent event) async {
    state.value = PasswordLoading();
    try {
      await updatePasswrodUseCase?.execute(event.password);
      print("object");
      state.value = PasswordCreatedSuccessfully();
    } catch (e) {
      state.value = PasswordCreationFailure(e.toString());
    }
  }
}