import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/menu/data/models/menu_models.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenuCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenu_state.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenu_event.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GetMenuController controller = Get.find<GetMenuController>();

  @override
  void initState() {
    super.initState();
    controller.fetchMenuDetails(FetchMenuDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú de Platillos"),
      ),
      body: Obx(() {
        if (controller.state.value is MenuLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.state.value is PostsLoaded) {
          return buildMenuButtonsList();
        } else if (controller.state.value is MenuFetchingFailure) {
          return Center(
            child: Text((controller.state.value as MenuFetchingFailure).error),
          );
        } else {
          return const Center(child: Text("Estado no reconocido"));
        }
      }),
    );
  }

  Widget buildMenuButtonsList() {
    var posts = (controller.state.value as PostsLoaded).posts;
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        var post = posts[index];
        return MenuButtons(post: post);
      },
    );
  }
}

class MenuButtons extends StatelessWidget {
  final MenuModel post;
  const MenuButtons({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Container(
              width: 300, // Ancho modificado para adaptarse a más contenido
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Image.asset(
                        'assets/c.png',
                        width: 100,
                        height: 101,
                        fit: BoxFit.contain,
                      ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.nombre_platillo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(post.descripcion),
                        Text("\$${post.precio}", style: const TextStyle(fontSize: 14, color: Colors.red)),
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
  }
}
