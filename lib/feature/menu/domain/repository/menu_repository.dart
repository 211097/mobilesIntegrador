import 'package:sazzon/feature/menu/data/models/menu_models.dart';

abstract class MenuRepository {
  Future<void> registerMenu(MenuModel menuModel);

  Future<List<MenuModel>>getMenu();
  Future<List<MenuModel>>getMenuid(String id);

  Future<void> updateMenu(MenuModel menuModel);


}