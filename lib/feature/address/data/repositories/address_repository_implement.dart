
import 'package:sazzon/feature/address/data/datasource/address_api_data_source.dart';
import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/address/domain/repository/address_repository.dart';
import 'package:sazzon/feature/coment/data/models/comment_models.dart';



class AddressRepositoryImp implements AddressRepository {
  final AddressApiDataSource addressApiDataSource;

  AddressRepositoryImp({required this.addressApiDataSource});

  @override
  Future<void> PoshAddres(AddressModel addressModel) async {
    await addressApiDataSource.PoshAddres(addressModel);
  }

  @override
  Future<List<AddressModel>> getAddress(String id) async => await addressApiDataSource.getAddress(id);

  @override
  Future<void> updateAddress(AddressModel addressModel) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}
