import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/address/domain/repository/address_repository.dart';

class PoshaddressUseCase {
  final AddressRepository addressRepository;

  PoshaddressUseCase(this.addressRepository);

  Future<void> execute(AddressModel addressModel) async {
    try {
      await addressRepository.PoshAddres(addressModel);
    } catch (e, stackTrace) {
      print('Error durante la creación de la dirección: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }
  }
}
