import 'package:get/get.dart';
import 'package:sazzon/feature/user/domain/usecase/register_user_usecase.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/register_event.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/register_state.dart';


class CreatePostController extends GetxController {
  final RegisterUserUseCase registerUserUseCase;
  var state = Rx<CreatePostState>(UserInitial());
  CreatePostController({required this.registerUserUseCase});
  createUser(CreateUserEvent event) async {
    state.value = UserLoading();
    try {
      await registerUserUseCase.execute(event.user);
      print("object");
      state.value = UserCreatedSuccessfully();
    } catch (e) {
      state.value = UserCreationFailure(e.toString());
    }
  }
}