
import 'package:sazzon/feature/menu/data/datasource/menu_api_data_source.dart';
import 'package:sazzon/feature/menu/data/models/menu_models.dart';
import 'package:sazzon/feature/menu/domain/repository/menu_repository.dart';

class MenuRepositoryImp implements MenuRepository {
  final MenuApiDataSource menuApiDataSource;

  MenuRepositoryImp({required this.menuApiDataSource});

  @override
  Future<List<MenuModel>> getMenu() async {
    return await menuApiDataSource.getMenu();
  }

  @override
  Future<void> registerMenu(MenuModel menuModel) async {
    return await menuApiDataSource.registerMenu(menuModel);
  }

  @override
  Future<void> updateMenu(MenuModel menuModel) async {
    return await menuApiDataSource.updateMenu(menuModel);
  }
  
  @override
  Future<List<MenuModel>> getMenuid(String id)async {
    return await menuApiDataSource.getMenuid( id);
  }
}
