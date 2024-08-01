import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';

class WeAre extends StatefulWidget {
  const WeAre({super.key});

  @override
  State<WeAre> createState() => _WeAreState();
}

class _WeAreState extends State<WeAre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Cambia el color del ícono aquí
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 0),
            const Text(
              "SEZZON",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        // background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/rama.png'),
            fit: BoxFit.cover,
          ),
        ),

        // content box
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //  second box content
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    // Imagen superpuesta con posición absoluta
                    Positioned(
                      left: 180,
                      top: 20,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/pollo-removebg-preview.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // box content black
                    Positioned(
                      left: 50, // Ajusta la posición en el eje X
                      top: 0, // Ajusta la posición en el eje Y
                      child: SizedBox(
                        width: 130, // Ancho del cuadro
                        height: 140, // Alto del cuadro
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: const TextSpan(
                              text: '"Barriga llena, \nCorazón\nContento.',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // first box
              Padding(
                padding: const EdgeInsets.fromLTRB(130, 0, 0, 20),
                child: Container(
                  width: 297, // Ancho fijo en lugar de double.infinity
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: SizedBox(
                            width: 220,
                            child: Text(
                              'Soluciones a tu apretada agenda semanal. Entendemos que no siempre tienes tiempo para cocinar, por eso ofrecemos una variedad de platos que puedes elegir para consumir durante toda la semana.',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                      ),
                      // tercera flor
                      Positioned(
                        left: -85,
                        top: 10,
                        child: Container(
                          width: 110,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/Gerbera-PNG-amarilla.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // segunda flor
                      Positioned(
                        left: -60,
                        top: -50,
                        child: Container(
                          width: 80,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/Gerbera-PNG-amarilla.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // primera flor
                      Positioned(
                        left: -20,
                        top: -86,
                        child: Container(
                          width: 60,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/Gerbera-PNG-amarilla.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // thirdh box
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 130, 20),
                child: Container(
                  width: 297, // Ancho fijo en lugar de double.infinity
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF6532A),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: SizedBox(
                            width: 210,
                            child: Text(
                              'Nuestro servicio se realiza exclusivamente los días domingos. Nos preocupamos por tu tiempo y comodidad, haciendo que recibir alimentos frescos y deliciosos sea un proceso sin complicaciones.',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                              textAlign:
                                  TextAlign.left, // Alineación a la izquierda
                            ),
                          ),
                        ),
                      ),
                      // tercera flor
                      Positioned(
                        right: -80,
                        top: -35,
                        child: Container(
                          width: 110,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/flor_blanca.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // segunda flor
                      Positioned(
                        right: -60,
                        top: 20,
                        child: Container(
                          width: 80,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/flor_blanca.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // primera flor
                      Positioned(
                        right: -25,
                        top: 60,
                        child: Container(
                          width: 60,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/flor_blanca.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // fourth
              Padding(
                padding: const EdgeInsets.fromLTRB(130, 0, 0, 20),
                child: Container(
                  width: 297, // Ancho fijo en lugar de double.infinity
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1F1C1C),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: SizedBox(
                            width: 220,
                            child: Text(
                              'Sabemos lo importante que es disfrutar de una buena comida sin la necesidad de pasar horas en la cocina. Al elegir nuestros platillos, garantizas una semana llena de opciones sabrosas.',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ),
                      // tercera flor
                      Positioned(
                        left: -85,
                        top: 10,
                        child: Container(
                          width: 110,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/fllor.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // segunda flor
                      Positioned(
                        left: -60,
                        top: -50,
                        child: Container(
                          width: 80,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/fllor.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // primera flor
                      Positioned(
                        left: -20,
                        top: -86,
                        child: Container(
                          width: 60,
                          height: 180,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/fllor.png',
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
