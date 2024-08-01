import 'package:sazzon/feature/menu/data/models/menu_models.dart';
import 'package:sazzon/feature/menu/domain/repository/menu_repository.dart';

class GetMenuUseCase {
  final MenuRepository menuRepository;

  GetMenuUseCase(this.menuRepository);

  Future<List<MenuModel>> execute() async {
    try {
      return await menuRepository.getMenu();
    } catch (e) {
      print('Error al obtener xd usuarios: $e');
      rethrow;
    }
  }
}
