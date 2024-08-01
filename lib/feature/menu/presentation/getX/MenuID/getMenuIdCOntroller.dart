import 'package:get/get.dart';
import 'package:sazzon/feature/menu/domain/usecase/getid_menu_usecase.dart';
import 'package:sazzon/feature/menu/presentation/getX/MenuID/getMenuId_event.dart';
import 'package:sazzon/feature/menu/presentation/getX/MenuID/getMenuId_state.dart';


class GetMenuIdController extends GetxController {
  final GetMenuidUseCase getMenuIdUseCase;

  var state = Rx<GetIdState>(MenuIDInitial());
  GetMenuIdController({required this.getMenuIdUseCase});
   fetchMenuDetails(FetchMenuIdDetailsEvent event) async {
    state.value = MenuIDLoading();
    try {
      // Suponiendo que la implementación del caso de uso ha sido adaptada para GET
      var userDetails = await getMenuIdUseCase.execute(event.id );
      state.value=GetIdLoaded(userDetails);
      print("Detalles del usuario obtenidos");
    } catch (e) {
      state.value = MenuFetchingFailure(e.toString());
    }
}
}