import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../domain/entities/updatepassword.dart';
import '../models/password_models.dart';

abstract class UserApiDataSource {
  Future<void> registerUser(userModel userModel);


  Future<void> updateUser(userModel userModel);

   Future<void> updatepassword(PasswordModels passwordModels);
}

class UserApiDataSourceImp implements UserApiDataSource {
  final String _baseUrl = 'https://users.sazzon.site/api/v1';
 
  

  @override
  Future<void> registerUser(userModel) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/users'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'name': userModel.name,
          'phone': userModel.phone,
          'email': userModel.email,
          'password': userModel.password,
          'admin': userModel.admin,
        }),
      );

      // Ahora que los datos se han enviado exitosamente, intenta enviar datos pendientes
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }

  @override
  Future<void> updateUser(userModel userModel) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/users'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'name': userModel.name,
          'phone': userModel.phone,
          'email': userModel.email,
          'password': userModel.password,
          'admin': userModel.admin,
        }),
      );

      // Ahora que los datos se han enviado exitosamente, intenta enviar datos pendientes
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }
  
  @override
  Future<void> updatepassword(PasswordModels passwordModels) async {
  try {
      await http.put(
        Uri.parse('$_baseUrl/users/${passwordModels.id}/password'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'password': passwordModels.password,
          
        }),
      );

      // Ahora que los datos se han actualizado exitosamente, intenta enviar datos pendientes
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }
  

}
