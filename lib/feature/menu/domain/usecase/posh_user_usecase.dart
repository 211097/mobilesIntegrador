import 'package:sazzon/feature/menu/data/models/menu_models.dart';
import 'package:sazzon/feature/menu/domain/repository/menu_repository.dart';


class PoshMenuUseCase {
  final MenuRepository menuRepository;
  PoshMenuUseCase(this.menuRepository);

  Future<void> execute(MenuModel menuModel,

  ) async {
    try {
      await menuRepository.registerMenu(menuModel);

    } catch (e,stackTrace) {
      print('Error during user registration: $e');
      print('StackTrace: $stackTrace');
      rethrow;
    }
  }

}