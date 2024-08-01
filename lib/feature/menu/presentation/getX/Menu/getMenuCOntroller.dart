import 'package:get/get.dart';
import 'package:sazzon/feature/menu/domain/usecase/get_menu_usecase.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenu_event.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenu_state.dart';

class GetMenuController extends GetxController {
  final GetMenuUseCase getMenuUseCase;
  var state = Rx<CreateGetState>(MenuInitial());
  GetMenuController({required this.getMenuUseCase});
  fetchMenuDetails(FetchMenuDetailsEvent event) async {
    state.value = MenuLoading();
    try {
      var userDetails = await getMenuUseCase.execute();
      state.value = PostsLoaded(userDetails);
      print("Detalles del usuario obtenidos");
    } catch (e) {
      state.value = MenuFetchingFailure(e.toString());
    }
  }
}
