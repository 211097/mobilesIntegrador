import 'package:flutter/material.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/registerUserCOntroller.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/register_event.dart';
// Agregado según lo solicitado
import 'package:get/get.dart';

class Registro1 extends StatefulWidget {
  const Registro1({super.key});

  @override
  _Registro1State createState() => _Registro1State();
}

class _Registro1State extends State<Registro1> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final CreatePostController createPostController =
      Get.find<CreatePostController>();

  Color minLengthColor = Colors.black;
  Color numberColor = Colors.black;
  Color specialCharColor = Colors.black;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    String password = passwordController.text;

    setState(() {
      minLengthColor = password.isEmpty
          ? Colors.black
          : (password.length >= 8 ? Colors.green : Colors.red);
      numberColor = password.isEmpty
          ? Colors.black
          : (password.contains(RegExp(r'\d')) ? Colors.green : Colors.red);
      specialCharColor = password.isEmpty
          ? Colors.black
          : (password.contains(RegExp(r'[#!\+\-=]'))
              ? Colors.green
              : Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFBDCEA1),
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 160),
                const Text(
                  'Ingresa tu nombre',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 50,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Nombre de usuario',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Espacio adicional entre campos
                const Text(
                  'Ingresa una contraseña',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
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
                        hintText: '******',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                    height:
                        8), // Espacio adicional entre campos y las condiciones
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 3),
                      Text(
                        '\u2022 Debe contener al menos 8 caracteres',
                        style: TextStyle(
                          color: minLengthColor,
                        ),
                      ),
                      Text(
                        '\u2022 Debe contener al menos un número',
                        style: TextStyle(
                          color: numberColor,
                        ),
                      ),
                      Text(
                        '\u2022 Debe contener al menos un carácter especial como #!+-=',
                        style: TextStyle(
                          color: specialCharColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16), // Espacio adicional entre campos
                const Text(
                  'Ingresa número telefónico',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 50,
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Número de teléfono',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Espacio adicional entre campos
                const Text(
                  'Ingresa un correo electrónico',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
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
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            top: 70, // Ajusta la posición según sea necesario
            right: 20, // Ajusta la posición según sea necesario
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: const Text(
                      'SEZZON',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 45,
            right: -30,
            child: ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String password = passwordController.text;
                String phone = phoneController.text;
                String email = emailController.text;
                String admin = 'false';
                print('Nombre: $name');
                print('Contraseña: $password');
                print('Teléfono: $phone');
                print('Correo electrónico: $email');
                final post = userModel(name: name, password: password, email: email, phone: phone,admin:admin
                );
                createPostController.createUser(CreateUserEvent(post));

                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IniciarSesion(),
                  ),
                );*/
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
              ),
              child: const Text(
                'Registrate',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                top: 68,
                right: 250, // Ajusta para mover el contenedor
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  // El IconButton se ha movido fuera de este Container
                ),
              ),
              Positioned(
                top: 65, // Ajusta para mover la flecha
                right: 330, // Ajusta para mover la flecha
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 55),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 650,
                right: 305, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 0, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/platano.png', // Replace with your image path
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
              Positioned(
                top: 350,
                right: 335, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 1, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/cebolla.png', // Replace with your image path
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                right: 335, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 1, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/lechga.png', // Replace with your image path
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
              Positioned(
                top: 500, // Ajustado para mantener la separación original,
                right: -50, // Ajustado para mantener la separación original
                child: Image.asset(
                  'assets/images/tomate.png', // Replace with your image path
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                top: 60, // Ajustado para mantener la separación original,
                right: -78, // Ajustado para mantener la separación original
                child: Image.asset(
                  'assets/images/nues.png', // Replace with your image path
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
