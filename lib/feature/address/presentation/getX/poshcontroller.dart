import 'package:sazzon/feature/address/domain/usecase/posh_address_usecase.dart';
import 'package:sazzon/feature/address/presentation/getX/posh_event.dart';
import 'package:sazzon/feature/address/presentation/getX/posh_state.dart';
import 'package:get/get.dart';

class PoshAddressController extends GetxController {
  final PoshaddressUseCase poshaddressUseCase;
  var state = Rx<CreatePostState>(AddressInitial());

  PoshAddressController({required this.poshaddressUseCase});

  createAddress(CreateAddressEvent event) async {
    state.value = AddressLoading();
    try {
      await poshaddressUseCase.execute(event.addressModel);
      print("Dirección creada exitosamente");
      state.value = AddressCreatedSuccessfully();
    } catch (e) {
      state.value = AddressCreationFailure(e.toString());
    }
  }
}
