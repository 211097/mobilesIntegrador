import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/address/domain/repository/address_repository.dart';

class GetAddressUseCase {
  final AddressRepository addressRepository;

  GetAddressUseCase(this.addressRepository);

  Future<List<AddressModel>> execute(String id) async {
    try {
      return await addressRepository.getAddress(id);
    } catch (e) {
      print('Error al obtener direcciones: $e');
      throw e;
    }
  }
}
