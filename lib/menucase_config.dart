import 'package:sazzon/feature/menu/data/datasource/menu_api_data_source.dart';
import 'package:sazzon/feature/menu/data/repositories/menu_repository_implement.dart';
import 'package:sazzon/feature/menu/domain/usecase/get_menu_usecase.dart';
import 'package:sazzon/feature/menu/domain/usecase/getid_menu_usecase.dart';
import 'package:sazzon/feature/menu/domain/usecase/posh_user_usecase.dart';

class MenucaseConfig {
  MenuApiDataSourceImp? menuApiDataSourceImp;
  MenuRepositoryImp? menuRepositoryImp;
  PoshMenuUseCase? poshMenuUseCase;
  GetMenuUseCase?getMenuUseCase;
  GetMenuidUseCase?getMenuidUseCase;
  MenucaseConfig() {
    menuApiDataSourceImp = MenuApiDataSourceImp();
    menuRepositoryImp =MenuRepositoryImp(menuApiDataSource: menuApiDataSourceImp!);
    poshMenuUseCase = PoshMenuUseCase(menuRepositoryImp!);
    getMenuUseCase = GetMenuUseCase(menuRepositoryImp!);
    getMenuidUseCase = GetMenuidUseCase(menuRepositoryImp!);
  }
}
