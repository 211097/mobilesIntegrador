import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sazzon/feature/user/presentation/administrador/admin/panel_control_gestion_clientes.dart';
import 'package:sazzon/feature/user/presentation/administrador/admin/panel_de_control.dart';
import 'dart:convert';

import 'package:sazzon/feature/menu/presentation/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../recovery_password/presentation/updatepassword.dart';

class IniciarSesio extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  IniciarSesio({super.key});

  Future<Map<String, dynamic>> postLogin(String email, String password) async {
    final String baseUrl = 'https://users.sazzon.site/api/v1';

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/userslogin'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Guardar el ID del usuario en SharedPreferences
        if (data.containsKey('id')) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('userId', data['id'].toString());
        }

        // Validación del dominio de correo electrónico
        if (email.endsWith('@sazzon.com')) {
          // Navegar a la vista específica para @sazzon.com
          Get.off(() =>
              PanelControlGestionClientes()); // Asegúrate de importar SazzonView
        } else if (email.endsWith('@gmail.com')) {
          // Navegar a la pantalla Menu para @gmail.com
          Get.off(() => Menu());
        } else {
          // Para otros dominios de correo, puedes decidir qué hacer
          // Por ahora, redirigimos a Menu como comportamiento predeterminado
          Get.off(() => Menu());
        }

        return data;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print('Error during login: $e');
      throw Exception('Login error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Color(0xFFBDCEA1),
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 450),
                const Text(
                  'Ingresa un correo electrónico',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 320,
                    height: 50,
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Correo electrónico',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Ingresa una contraseña',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 320,
                    height: 50,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '***********',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() =>
                          How()); // Navegamos a la pantalla Updatepassword
                    },
                    child: Text(
                      '¡Olvidé mi contraseña!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            right: 20,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'SEZZON',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 45,
            left: -30,
            child: ElevatedButton(
              onPressed: () async {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  try {
                    final result = await postLogin(emailController.text.trim(),
                        passwordController.text.trim());
                    print('Login successful: $result');
                    // Handle successful login here (e.g., navigate to home screen)
                    Get.snackbar('Éxito', 'Inicio de sesión exitoso',
                        snackPosition: SnackPosition.BOTTOM);
                  } catch (e) {
                    print('Login failed: $e');
                    Get.snackbar('Error', 'Inicio de sesión fallido',
                        snackPosition: SnackPosition.BOTTOM);
                  }
                } else {
                  Get.snackbar('Error', 'Por favor, completa todos los campos',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
              ),
              child: Text(
                'Iniciar sesión',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                top: 68,
                right: 250,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 65,
                right: 330,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 55),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 300,
                right: 300,
                child: Transform.rotate(
                  angle: 1,
                  child: Image.asset(
                    'assets/images/gerbera_rosa-removebg-preview.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                right: 310,
                child: Transform.rotate(
                  angle: 1,
                  child: Image.asset(
                    'assets/images/Gerbera-PNG-amarilla.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Positioned(
                top: 140,
                left: 240,
                child: Transform.rotate(
                  angle: 0,
                  child: Image.asset(
                    'assets/images/sarten.png',
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              Positioned(
                top: 240,
                right: 170,
                child: Text(
                  'Tripa vacía,\ncorazón sin \nalegría',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
