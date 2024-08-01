import 'package:sazzon/feature/coment/data/models/comment_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CommentApiDataSource {
  Future<void> PoshComment(CommentModel commentModel);

  Future<List<CommentModel>> getComment(String id);

  Future<void> updateComment(CommentModel commentModel);
}

class CommentApiDataSourceImp implements CommentApiDataSource {
  final String _baseUrl = 'http://3.82.99.167:3002/comentarios';

  @override
  Future<List<CommentModel>> getComment(String id) async {
    var response = await http.get(Uri.parse('$_baseUrl/$id'));
//          Uri.parse('$_baseUrl/users'),

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);

      // Asegúrate de acceder a la clave 'data' si los datos están contenidos ahí
      if (body['data'] != null) {
        List<dynamic> data = body['data'];
        List<CommentModel> posts = data
            .map<CommentModel>((post) => CommentModel.fromJson(post))
            .toList();
        return posts;
      } else {
        throw Exception('Data field is missing');
      }
    } else {
      throw Exception('Failed to load menu');
    }
  }

  @override
  Future<void> PoshComment(CommentModel commentModel) async {
    try {
      await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'id_platillo': commentModel.id_platillo,
          'id_user': commentModel.id_user,
          'comentario': commentModel.comentario,
          'calificacion': commentModel.calificacion.toString(),
        }),
      );

      // Ahora que los datos se han enviado exitosamente, intenta enviar datos pendientes
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }

  @override
  Future<void> updateComment(CommentModel commentModel) {
    // TODO: implement updateMenu
    throw UnimplementedError();
  }
}
