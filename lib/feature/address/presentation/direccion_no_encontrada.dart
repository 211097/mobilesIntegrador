import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/address/presentation/getX/get_event.dart';
import 'package:sazzon/feature/address/presentation/getX/get_state.dart';
import 'package:sazzon/feature/address/presentation/getX/getcontroller.dart';
import 'package:sazzon/feature/address/domain/entities/address.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:sazzon/feature/address/presentation/direccion_registro_direccion.dart';
import 'package:sazzon/feature/menu/presentation/usuario_menu/presentation/paypal.dart';

class DireccionNoEncontrada extends StatelessWidget {
  final GetAddressController controller = Get.find<GetAddressController>();
  final RxInt selectedAddressIndex = (-1).obs;

  DireccionNoEncontrada({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchCoDetails(FetchAddressDetailsEvent("2"));

    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
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
      body: Obx(() {
        if (controller.state.value is AddressLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.state.value is PostsLoaded) {
          final posts = (controller.state.value as PostsLoaded).posts;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final address = posts[index];
                    return Obx(() => GestureDetector(
                          onTap: () => selectedAddressIndex.value = index,
                          child: Card(
                            margin: EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: selectedAddressIndex.value == index
                                    ? Colors.orange
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.orange,
                                    size: 24,
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Enviar a domicilio',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(address.calle),
                                        Text(address.colonia),
                                        Text('CP: ${address.postcode}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                  childCount: posts.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Obx(() => selectedAddressIndex.value != -1
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaypalPaymentView(
                                      selectedAddressIndex:
                                          selectedAddressIndex.value,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Continuar compra",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(double.infinity, 60),
                              ),
                            ),
                          )
                        : SizedBox.shrink()),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DireccionRegistroDireccion()),
                          );
                        },
                        child: Text(
                          "Agregar Dirección",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(double.infinity, 60),
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Espacio adicional al final
                  ],
                ),
              ),
            ],
          );
        } else if (controller.state.value is AddressFetchingFailure) {
          final error =
              (controller.state.value as AddressFetchingFailure).error;
          return Center(child: Text('Error: $error'));
        } else {
          return Center(child: Text("No hay ninguna dirección registrada."));
        }
      }),
    );
  }
}
