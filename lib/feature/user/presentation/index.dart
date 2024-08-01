import 'package:flutter/material.dart';
import 'package:sazzon/feature/user/presentation/pages/iniciarSeion.dart';
import 'package:sazzon/feature/user/presentation/pages/registro.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1), // Agrega el color de fondo
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get the screen size
          final screenHeight = MediaQuery.of(context).size.height;
          final screenWidth = MediaQuery.of(context).size.width;

          return Stack(
            children: [
              Positioned(
                top: screenHeight * 0.05, // 5% from top
                left: 0, // Alinea el botón con el borde izquierdo
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registro1(),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
                    child: Container(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: constraints.maxWidth > 600
                          ? screenWidth * 0.3
                          : screenWidth *
                              0.5, // Ajusta el ancho del contenedor según necesites
                      height:
                          50, // Ajusta la altura del contenedor según necesites
                      child: Center(
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                    SizedBox(
                        width: constraints.maxWidth > 600
                            ? 10
                            : 40), // Espacio entre el botón y el texto
                    Column(
                      children: [
                        Text(
                          'SEZZON',
                          style: TextStyle(
                            fontSize: constraints.maxWidth > 600 ? 20 : 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        if (constraints.maxWidth <= 600) ...[
                          const SizedBox(
                              height: 40), // Espacio entre el texto y la imagen
                          Image.asset(
                            'assets/images/Gerbera-PNG-amarilla.png',
                            width: 145,
                            height: 140,
                          ),
                        ]
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: screenHeight *
                    (constraints.maxWidth > 600
                        ? 0.05
                        : 0.03), // Ajusta según el tamaño de la pantalla
                left: 0, // Alinea el botón con el borde izquierdo
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IniciarSesio(),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
                    child: Container(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: constraints.maxWidth > 600
                          ? screenWidth * 0.3
                          : screenWidth *
                              0.5, // Ajusta el ancho del contenedor según necesites
                      height:
                          50, // Ajusta la altura del contenedor según necesites
                      child: Center(
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Nueva imagen
              Positioned(
                top: constraints.maxWidth > 600
                    ? screenHeight * 0.45
                    : screenHeight * 0.299, // Centra la imagen verticalmente
                right: constraints.maxWidth > 600
                    ? -screenWidth * 0.25
                    : -screenWidth *
                        0.110, // Coloca la imagen fuera de la vista inicialmente
                child: Image.asset(
                  'assets/images/plato madera.png', // Ruta de la imagen
                  width: constraints.maxWidth > 600
                      ? screenWidth * 0.10
                      : screenWidth *
                          0.5, // Ajusta el tamaño de la imagen según necesites
                  height: constraints.maxWidth > 600
                      ? screenHeight * 0.6
                      : screenHeight *
                          0.5, // Ajusta el tamaño de la imagen según necesites
                ),
              ),
              if (constraints.maxWidth <= 600) ...[
                Positioned(
                  top: screenHeight * 0.05, // Debajo del botón de registrarse
                  left: -screenWidth *
                      0.3, // Coloca la imagen fuera de la vista inicialmente
                  child: Transform.rotate(
                    angle: 30, // Rotación de la imagen en grados
                    child: Image.asset(
                      'assets/images/wooden-rolling-pin-png.png', // Ruta de la imagen
                      width: screenWidth *
                          0.7, // Ajusta el tamaño de la imagen según necesites
                      height: screenHeight *
                          0.5, // Ajusta el tamaño de la imagen según necesites
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight *
                      0.45, // Ajusta esto para centrar el texto verticalmente
                  left: screenWidth * 0.50 -
                      160, // Centra el texto horizontalmente
                  child: const SizedBox(
                    width: 200, // Ancho del contenedor del texto
                    child: Text(
                      '“Ordena sin piedad que aquí te vamos a cuidar...”',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}
