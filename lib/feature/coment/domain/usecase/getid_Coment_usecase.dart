import 'package:sazzon/feature/menu/data/models/menu_models.dart';
import 'package:sazzon/feature/menu/domain/repository/menu_repository.dart';

class GetMenuidUseCase {
  final MenuRepository menuRepository;

  GetMenuidUseCase(this.menuRepository);

  Future<List<MenuModel>> execute(String id) async {
    try {
      return await menuRepository.getMenuid(id);
    } catch (e) {
      print('Error al obtener xd usuarios: $e');
      rethrow;
    }
  }
}
