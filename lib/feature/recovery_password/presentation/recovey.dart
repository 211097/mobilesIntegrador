import 'package:flutter/material.dart';

class Recovey extends StatefulWidget {
  const Recovey({super.key});

  @override
  State<Recovey> createState() => _RecoveyState();
}

class _RecoveyState extends State<Recovey> {
  final _formKey = GlobalKey<FormState>();

  // bolean
  bool flag = false;

  // controller
  final TextEditingController _controller = TextEditingController();

  // state flag
  void toggleFlag() {
    setState(() {
      flag = true;
    });
  }

  void toggleFlag2() {
    setState(() {
      flag = false;
    });
  }

// verify input
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      toggleFlag2();
      _showAlertDialog(context);
    } else {
      // Si el formulario no es válido, muestra un mensaje de error
      toggleFlag();
    }
  }

  // content: const Text('Te hemos enviado un mensaje a tu correo, revisa tú bandeja'),

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            // AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min, // Para limitar el tamaño vertical
              children: <Widget>[
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Alineación a la derecha
                  children: <Widget>[
                    IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.close_outlined),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                const Text(
                  'Te hemos enviado un mensaje a tu correo, revisa tu bandeja.',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
              ],
            ),
            alignment: const Alignment(0.1, -0.6));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20), 
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 65,
                    decoration: BoxDecoration(
                      color: flag ? Colors.red : Colors.black,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      iconSize: 30,
                    ),
                  ),

                  const SizedBox(width: 40), // Espacio entre widgets
                  const Expanded(
                    child: Text(
                      "SEZZON",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              // image with text
              Column(
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
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        // Imagen superpuesta con posición absoluta
                        Positioned(
                          left: -80,
                          top: -20,
                          child: Container(
                            width: 476,
                            height: 290,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/a.png',
                              width: 20,
                              height: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // box content black
                        Positioned(
                          left: 40, // Ajusta la posición en el eje X
                          top: 90, // Ajusta la posición en el eje Y
                          child: SizedBox(
                            width: 300, // Ancho del cuadro
                            // height: 140, // Alto del cuadro
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: const TextSpan(
                                  text:
                                      'Te enviearemos un mensaje al\n correo con el que te registraste\n para que recuperes tu contraseña.',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -10,
                          top: 260,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/flor_blanca.png',
                              width: 20,
                              height: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -70,
                          top: 500,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/flor_blanca.png',
                              width: 20,
                              height: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 180),

              // input text "email"
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ingresa una correo',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 236,
                          // height: 70,
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '• Please enter somer email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled:
                                  true, // Esta propiedad asegura que el fondo esté lleno
                              fillColor: Colors.black, // Color de fondo negro
                              contentPadding:
                                  const EdgeInsets.only(left: 10.0, top: 16.0),
                              hintText: "email@gmail.com",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide.none,
                              ),
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // button
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                child: SizedBox(
                  width: 412,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ButtonStyle(
                      backgroundColor: flag
                          ? WidgetStateProperty.all<Color>(Colors.red)
                          : WidgetStateProperty.all<Color>(Colors.black),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ), // Bordes redondeados solo en el lado derecho
                        ),
                      ),
                    ),
                    child: const Text(
                      "Enviar correo",
                      style: TextStyle(
                        color: Colors.white, // Color del texto blanco
                      ),
                    ),
                  ),
                ),
              ),
              // flores
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        //  second box content
                        Container(
                          width: double.infinity,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        // box content black

                        Positioned(
                          left: 10,
                          top: -39,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/flor_blanca.png',
                              width: 20,
                              height: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90,
                          top: 39,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/flor_blanca.png',
                              width: 20,
                              height: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 170,
                          top: -10,
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/flor_blanca.png',
                              width: 20,
                              height: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
