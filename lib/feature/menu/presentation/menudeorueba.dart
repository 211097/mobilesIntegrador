import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenuCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenu_state.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenu_event.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';

class MenuPage5 extends StatefulWidget {
  const MenuPage5({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage5> {
  final GetMenuController controller = Get.find<GetMenuController>();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.fetchMenuDetails(FetchMenuDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(189, 206, 161, 1),
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
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/rama.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                // ads
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
                                text: '"El pollo que\n conquista tú\n paladar',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // content
                const SizedBox(height: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Alineación central horizontal
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6532A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Desayuno",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6532A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Comidas",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6532A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Cenas",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // eats
                //  const MenuButtons(), // Utiliza aquí el nuevo widget
              ])),
          Expanded(
            child: Obx(() {
              if (controller.state.value is MenuLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.state.value is PostsLoaded) {
                var posts = (controller.state.value as PostsLoaded).posts;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    var post = posts[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300, // Ancho para más contenido
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/c.png',
                                          width: 100,
                                          height: 101,
                                          fit: BoxFit.contain,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Center(
                                                child: Image.asset(
                                                  'assets/star_1.png',
                                                  width:
                                                      20, // Ancho deseado para la imagen
                                                  height:
                                                      20, // Alto deseado para la imagen
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Center(
                                                child: Image.asset(
                                                  'assets/star_1.png',
                                                  width:
                                                      20, // Ancho deseado para la imagen
                                                  height:
                                                      20, // Alto deseado para la imagen
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Center(
                                                child: Image.asset(
                                                  'assets/star_1.png',
                                                  width:
                                                      20, // Ancho deseado para la imagen
                                                  height:
                                                      20, // Alto deseado para la imagen
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Center(
                                                child: Image.asset(
                                                  'assets/star_1.png',
                                                  width:
                                                      20, // Ancho deseado para la imagen
                                                  height:
                                                      20, // Alto deseado para la imagen
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Center(
                                                child: Image.asset(
                                                  'assets/star_1.png',
                                                  width:
                                                      20, // Ancho deseado para la imagen
                                                  height:
                                                      20, // Alto deseado para la imagen
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(post.nombre_platillo,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Text(post.descripcion),
                                        Text("\$${post.precio}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              } else if (controller.state.value is MenuFetchingFailure) {
                return Center(
                  child: Text(
                      (controller.state.value as MenuFetchingFailure).error),
                );
              } else {
                return const Center(child: Text("Estado no reconocido"));
              }
            }),
          ),
        ],
      ),
    );
  }
}
