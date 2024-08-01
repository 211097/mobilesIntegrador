import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';

class PanelControlGestionClientes extends StatefulWidget {
  const PanelControlGestionClientes({super.key});

  @override
  State<PanelControlGestionClientes> createState() => _WeAreState();
}

class _WeAreState extends State<PanelControlGestionClientes> {
  @override
  Widget build(BuildContext context) {
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
            _buildClientTable(),
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

  Widget _buildClientTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: const Text(
              'Gestión de clientes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Table(
            border: TableBorder(
              horizontalInside: BorderSide(color: Colors.grey[300]!),
            ),
            children: [
              _buildTableHeader(),
              _buildClientRow(
                  '1', 'Marina Shago', 'marina@gmail.com', '996152234'),
              _buildClientRow('2', 'José Pérez', 'Jose@gmail.com', '981256745'),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[100]),
      children: ['ID', 'Nombre', 'Correo', 'Número celular']
          .map((header) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    header,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ))
          .toList(),
    );
  }

  TableRow _buildClientRow(String id, String name, String email, String phone) {
    return TableRow(
      children: [id, name, email, phone]
          .map((cell) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(cell),
                ),
              ))
          .toList(),
    );
  }
}
