import 'package:sazzon/feature/address/data/datasource/address_api_data_source.dart';
import 'package:sazzon/feature/address/data/repositories/address_repository_implement.dart';
import 'package:sazzon/feature/address/domain/usecase/get_ddress_usecase.dart';
import 'package:sazzon/feature/address/domain/usecase/posh_address_usecase.dart';


class AddresscaseConfig {
  AddressApiDataSourceImp? addressApiDataSourceImp;
  AddressRepositoryImp? addressRepositoryImp;
  GetAddressUseCase? getAddressUseCase;
  PoshaddressUseCase? poshaddressUseCase;

  AddresscaseConfig() {
    addressApiDataSourceImp = AddressApiDataSourceImp();
    addressRepositoryImp =
        AddressRepositoryImp(addressApiDataSource: addressApiDataSourceImp!);
    getAddressUseCase = GetAddressUseCase(addressRepositoryImp!);
    poshaddressUseCase = PoshaddressUseCase(addressRepositoryImp!);
  }
}