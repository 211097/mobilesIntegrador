import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/menu/presentation/menu.dart';
import 'package:sazzon/feature/user/presentation/pages/iniciarSeion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class How extends StatefulWidget {
  @override
  _HowState createState() => _HowState();
}

class _HowState extends State<How> {
  final TextEditingController passwordController = TextEditingController();

  Color minLengthColor = Colors.black;
  Color numberColor = Colors.black;
  Color uppercaseColor = Colors.black;
  Color specialCharColor = Colors.black;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    String password = passwordController.text;

    setState(() {
      minLengthColor = Colors.black;
      numberColor = Colors.black;
      uppercaseColor = Colors.black;
      specialCharColor = Colors.black;

      if (password.length >= 8) {
        minLengthColor = Colors.green;
        if (password.contains(RegExp(r'\d'))) {
          numberColor = Colors.green;
          if (password.contains(RegExp(r'[A-Z]'))) {
            uppercaseColor = Colors.green;
            if (password.contains(RegExp(r'[#!\+\-=]'))) {
              specialCharColor = Colors.green;
            }
          }
        }
      }

      if (password.isNotEmpty) {
        if (password.length < 8) minLengthColor = Colors.red;
        if (!password.contains(RegExp(r'\d'))) numberColor = Colors.red;
        if (!password.contains(RegExp(r'[A-Z]'))) uppercaseColor = Colors.red;
        if (!password.contains(RegExp(r'[#!\+\-=]')))
          specialCharColor = Colors.red;
      }
    });
  }

  Future<void> updatePassword(String newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId == null) {
      throw Exception('User ID not found');
    }

    final String baseUrl = 'https://users.sazzon.site/api/v1';

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/$userId/password'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'password': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Éxito', 'Contraseña actualizada con éxito');

        // Esperar un momento para que el usuario pueda ver el mensaje de éxito
        await Future.delayed(Duration(seconds: 2));

        // Limpiar las preferencias del usuario
        await prefs.clear();

        // Reiniciar la aplicación llevando al usuario a la pantalla de inicio de sesión
        Get.offAll(() => IniciarSesio());
      } else {
        throw Exception('Failed to update password');
      }
    } catch (e) {
      print('Error updating password: $e');
      Get.snackbar('Error', 'No se pudo actualizar la contraseña');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => IniciarSesio());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            },
          ),
          title: Text(
            'SEZZÓN',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xFFD0E0C0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 33),
                      _buildPasswordField(),
                      SizedBox(height: 8),
                      _buildPasswordRequirements(),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: ElevatedButton(
                  child: Text(
                    'Guardar cambios',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (passwordController.text.isNotEmpty &&
                        minLengthColor == Colors.green &&
                        numberColor == Colors.green &&
                        uppercaseColor == Colors.green &&
                        specialCharColor == Colors.green) {
                      updatePassword(passwordController.text);
                    } else {
                      Get.snackbar(
                          'Error', 'Por favor, ingrese una contraseña válida');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        filled: true,
        fillColor: Colors.black,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: Icon(Icons.visibility_off, color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildPasswordRequirements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRequirement(
            'Debe contener al menos 8 caracteres', minLengthColor),
        _buildRequirement('Debe contener al menos un número', numberColor),
        _buildRequirement(
            'Debe contener al menos una letra mayúscula', uppercaseColor),
        _buildRequirement(
            'Debe contener al menos un caracter especial \$\#\!\+\-\=',
            specialCharColor),
      ],
    );
  }

  Widget _buildRequirement(String text, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: color),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 12, color: color)),
        ],
      ),
    );
  }
}
