import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/usuario_menu/presentation/fac.dart';

import 'package:sazzon/feature/menu/presentation/usuario_menu/presentation/como_funciona.dart';
import 'package:sazzon/feature/menu/presentation/menu.dart';
import 'package:sazzon/feature/menu/presentation/usuario_menu/presentation/quienes_Somos.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenuCOntroller.dart';
import 'package:sazzon/feature/recovery_password/presentation/updatepassword.dart';
import 'package:sazzon/feature/user/presentation/pages/updateUser.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({super.key});

  @override
  State<BarMenu> createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
  late final GetMenuController getMenuController;

  void screenWeare(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WeAre()),
    );
  }

  void screenMenu(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Menu()),
    );
  }

  void screenHowItWorks(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HowItWorks()),
    );
  }

  void screenPerfil(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => How()),
    );
  }

  // Nuevo método para navegar a FAQ
  void screenFaq(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Fac()),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 400,
      margin: const EdgeInsets.only(top: 10, bottom: 225),
      width: 250,
      child: SizedBox(
        width: 200,
        height: 200,
        child: Drawer(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Transform.rotate(
                angle: 110 * (0.14159265359 / 180),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tree.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Image.asset(
                    'assets/tree.png',
                    width: 1900,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: const Text('Menú',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      screenMenu(context);
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                  ListTile(
                    title: const Text(
                      '¿Quiénes somos?',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      screenWeare(context);
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                  ListTile(
                    title: const Text(
                      '¿Cómo funciona?',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      screenHowItWorks(context);
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                  ListTile(
                    title: const Text(
                      'Preguntas\nfrecuentes',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      screenFaq(
                          context); // Cambio aquí para usar el nuevo método
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                  ListTile(
                    title: const Text(
                      'Perfil',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      screenPerfil(context);
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
