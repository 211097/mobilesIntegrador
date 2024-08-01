import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';

class PanelControlGestionPedidos extends StatefulWidget {
  const PanelControlGestionPedidos({super.key});

  @override
  State<PanelControlGestionPedidos> createState() => _WeAreState();
}

class _WeAreState extends State<PanelControlGestionPedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "SEZZON",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Panel de control',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Icon(Icons.grid_view, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButton('Reportes', Icons.bar_chart),
                _buildButton('Clientes', Icons.people),
                _buildButton('Pedidos', Icons.receipt_long),
                _buildButton('Platillos', Icons.restaurant_menu),
              ],
            ),
            const SizedBox(height: 26),
            _buildPedidosTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 24),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildPedidosTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: const Text(
              'Gestión de pedidos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(3),
              4: FlexColumnWidth(1),
            },
            border: TableBorder.all(color: Colors.grey[300]!),
            children: [
              _buildTableHeader(),
              _buildPedidoRow('1', 'Marina Sibaja', '21/06/2024',
                  'Av. 4 mz G lote 6, col. Capulines', Icons.visibility),
              _buildPedidoRow('2', 'José Pérez', '21/06/2024', 'Jose@gmail.com',
                  Icons.visibility),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[100]),
      children: ['ID', 'Cliente', 'Fecha', 'Dirección', 'Ver']
          .map((header) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    header,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
          .toList(),
    );
  }

  TableRow _buildPedidoRow(String id, String cliente, String fecha,
      String direccion, IconData icon) {
    return TableRow(
      children: [
        _buildCell(id, TextAlign.center),
        _buildCell(cliente, TextAlign.left),
        _buildCell(fecha, TextAlign.center),
        _buildCell(direccion, TextAlign.left),
        TableCell(
          child: IconButton(
            icon: Icon(icon, size: 20),
            onPressed: () {
              _showPedidoDetails(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCell(String text, TextAlign align) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: align,
        ),
      ),
    );
  }

  void _showPedidoDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            color: Color(0xFFBDCEA1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Detalles del pedido',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoSection('Información del cliente', [
                          'Nombre del cliente: Marina Sibaja Montoya',
                          'Dirección de entrega: Av. 4 mz G, lote 6, col. Capulines',
                          'Número de celular: 9981612282',
                        ]),
                        const SizedBox(height: 16),
                        _buildInfoSection('Información del pedido', [
                          'ID_Pedido: 41',
                          'Fecha: 21/06/2024',
                        ]),
                        const SizedBox(height: 16),
                        _buildArticulosPedidos(),
                        const SizedBox(height: 16),
                        _buildResumenPedido(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ...items.map((item) => Text(item)),
      ],
    );
  }

  Widget _buildArticulosPedidos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Artículos pedidos',
            style: TextStyle(fontWeight: FontWeight.bold)),
        _buildCategoriaArticulos('Desayunos', [
          {'nombre': 'Platillo Pancakes', 'cantidad': 2, 'precio': 40.00},
        ]),
        _buildCategoriaArticulos('Comidas', [
          {'nombre': 'Platillo Milanesa', 'cantidad': 1, 'precio': 60.00},
        ]),
        _buildCategoriaArticulos('Cenas', [
          {'nombre': 'Platillo Tacos', 'cantidad': 1, 'precio': 20.00},
        ]),
      ],
    );
  }

  Widget _buildCategoriaArticulos(
      String categoria, List<Map<String, dynamic>> articulos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(categoria, style: const TextStyle(fontWeight: FontWeight.bold)),
        ...articulos
            .map((articulo) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${articulo['nombre']}:'),
                    Text('- Cantidad: ${articulo['cantidad']}'),
                    Text(
                        '- Precio unitario: \$${articulo['precio'].toStringAsFixed(2)}'),
                    Text(
                        '- Subtotal: \$${(articulo['cantidad'] * articulo['precio']).toStringAsFixed(2)}'),
                  ],
                ))
            ,
      ],
    );
  }

  Widget _buildResumenPedido() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Resumen del Pedido',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Total: \$320.00'),
      ],
    );
  }
}
