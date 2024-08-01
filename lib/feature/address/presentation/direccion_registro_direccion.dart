import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/address/presentation/direccion_no_encontrada.dart';
import 'package:sazzon/feature/address/presentation/getX/posh_event.dart';
import 'package:sazzon/feature/address/presentation/getX/poshcontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DireccionRegistroDireccion extends StatefulWidget {
  const DireccionRegistroDireccion({Key? key}) : super(key: key);

  @override
  _DireccionRegistroDireccionState createState() =>
      _DireccionRegistroDireccionState();
}

class _DireccionRegistroDireccionState
    extends State<DireccionRegistroDireccion> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _calleController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  final TextEditingController _coloniaController = TextEditingController();
  final TextEditingController _numextController = TextEditingController();
  final TextEditingController _numintController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  final PoshAddressController createPostController =
      Get.find<PoshAddressController>();

  Future<void> registerAddress() async {
    if (_formKey.currentState!.validate()) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final userId = prefs.getString('userId');

        if (userId == null) {
          Get.snackbar('Error', 'No se encontró el ID del usuario');
          return;
        }

        final response = await http.post(
          Uri.parse('https://users.sazzon.site/api/v2/directions'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "userId": userId,
            "calle": _calleController.text,
            "postcode": _postcodeController.text,
            "colonia": _coloniaController.text,
            "num_ext": _numextController.text,
            "num_int": _numintController.text,
            "estado": _estadoController.text,
            "ciudad": _ciudadController.text,
            "descripcion": _descripcionController.text,
          }),
        );

        if (response.statusCode == 200) {
          Get.snackbar('Éxito', 'Dirección registrada correctamente');
          // Aquí puedes agregar la lógica para navegar a otra pantalla o actualizar la lista de direcciones
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DireccionNoEncontrada()),
          );
        } else {
          Get.snackbar('Error', 'No se pudo registrar la dirección');
        }
      } catch (e) {
        Get.snackbar('Error', 'Ocurrió un error al registrar la dirección: $e');
      }
    }
  }

  @override
  void dispose() {
    _calleController.dispose();
    _postcodeController.dispose();
    _coloniaController.dispose();
    _numextController.dispose();
    _numintController.dispose();
    _estadoController.dispose();
    _ciudadController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text('SEZZÓN', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildTextField('Calle', 'Av. Central entre 2 y 3 poniente',
                      Colors.red, _calleController),
                  _buildTextField('Código Postal', '29000', Colors.red,
                      _postcodeController),
                  _buildTextField(
                      'Colonia', 'Centro', Colors.red, _coloniaController),
                  _buildTextField('Número Exterior', '#2322', Colors.red,
                      _numextController),
                  _buildTextField('Número Interior (Opcional)', '', Colors.red,
                      _numintController),
                  _buildTextField(
                      'Estado', 'Chiapas', Colors.red, _estadoController),
                  _buildTextField(
                      'Ciudad', 'Suchiapa', Colors.red, _ciudadController),
                  _buildTextField('Descripción', 'Descripción adicional',
                      Colors.red, _descripcionController),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      child: Text('Guardar Dirección',
                          style: TextStyle(color: Colors.white)),
                      onPressed: registerAddress,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder, Color labelColor,
      TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: labelColor),
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
    );
  }
}
