import 'package:sazzon/feature/menu/data/models/menu_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class MenuApiDataSource {
  Future<void> registerMenu(MenuModel menuModel);

  Future<List<MenuModel>> getMenu();
  Future<List<MenuModel>> getMenuid(String id);

  Future<void> updateMenu(MenuModel menuModel);
}

class   MenuApiDataSourceImp implements MenuApiDataSource {
  final String _baseUrl = 'https://dish.sazzon.site/platillos/';

  @override
  Future<List<MenuModel>> getMenu() async {
    var response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);

      // Asegúrate de acceder a la clave 'data' si los datos están contenidos ahí
      if (body['data'] != null) {
        List<dynamic> data = body['data'];
        List<MenuModel> posts =
            data.map<MenuModel>((post) => MenuModel.fromJson(post)).toList();
        return posts;
      } else {
        throw Exception('Data field is missing');
      }
    } else {
      throw Exception('Failed to load menu');
    }
  }

  @override
  Future<void> registerMenu(MenuModel menuModel) {
    // TODO: implement registerMenu
    throw UnimplementedError();
  }

  @override
  Future<void> updateMenu(MenuModel menuModel) {
    // TODO: implement updateMenu
    throw UnimplementedError();
  }

  @override
  Future<List<MenuModel>> getMenuid(String id) async {
    var response = await http.get(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);

      // Asegúrate de acceder a la clave 'data' si los datos están contenidos ahí
      if (body['data'] != null) {
        List<dynamic> data = body['data'];
        List<MenuModel> posts =
            data.map<MenuModel>((post) => MenuModel.fromJson(post)).toList();
        return posts;
      } else {
        throw Exception('Data field is missing');
      }
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
