import 'package:sazzon/feature/address/data/models/address_models.dart';

abstract class AddressRepository {
  Future<void> PoshAddres(AddressModel addressModel);
  Future<List<AddressModel>> getAddress(String id);
  Future<void> updateAddress(AddressModel addressModel);
}