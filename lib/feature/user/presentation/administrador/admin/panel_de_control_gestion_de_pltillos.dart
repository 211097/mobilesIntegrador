import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';

class PanelDeControlGestionDePltillos extends StatefulWidget {
  const PanelDeControlGestionDePltillos({super.key});

  @override
  State<PanelDeControlGestionDePltillos> createState() => _WeAreState();
}

class _WeAreState extends State<PanelDeControlGestionDePltillos> {
  final TextEditingController _ingredientesController = TextEditingController();

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
            Expanded(child: _buildPlatillosTable()),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    _showNewRecipeModal(context);
                  },
                ),
              ),
            ),
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

  Widget _buildPlatillosTable() {
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
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: const Text(
              'Gestión de platillos',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
            },
            border: TableBorder.all(color: Colors.grey[300]!),
            children: [
              _buildTableHeader(),
              _buildPlatilloRow(
                  '1', 'Milanesa', 'Comida', Icons.edit, Icons.delete),
              _buildPlatilloRow(
                  '2', 'Mole', 'Comida', Icons.edit, Icons.delete),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[100]),
      children: ['ID', 'Nombre', 'Categoría', 'Modificar', 'Eliminar']
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

  TableRow _buildPlatilloRow(String id, String nombre, String categoria,
      IconData editIcon, IconData deleteIcon) {
    return TableRow(
      children: [
        _buildCell(id, TextAlign.center),
        _buildCell(nombre, TextAlign.left),
        _buildCell(categoria, TextAlign.left),
        TableCell(
          child: IconButton(
            icon: Icon(editIcon, size: 20),
            onPressed: () {
              // Handle edit action
            },
          ),
        ),
        TableCell(
          child: IconButton(
            icon: Icon(deleteIcon, size: 20),
            onPressed: () {
              _showDeleteConfirmationDialog(id, nombre);
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

  void _showNewRecipeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Nueva Receta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Nombre del platillo'),
                  const SizedBox(height: 10),
                  _buildDropdownField(
                      'Categoría', ['Desayuno', 'Comida', 'Cena']),
                  const SizedBox(height: 10),
                  _buildIngredientesField(),
                  const SizedBox(height: 10),
                  _buildTextField('Instrucciones', maxLines: 3),
                  const SizedBox(height: 10),
                  _buildUploadButton('Subir imagen'),
                  const SizedBox(height: 10),
                  _buildTextField('Precio'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text('Guardar'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text('Cancelar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
    );
  }

  Widget _buildDropdownField(String label, List<String> items) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }

  Widget _buildIngredientesField() {
    return TextField(
      controller: _ingredientesController,
      decoration: InputDecoration(
        labelText: 'Ingredientes',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.delete, size: 20),
          onPressed: () {
            setState(() {
              _ingredientesController.clear();
            });
          },
        ),
      ),
    );
  }

  Widget _buildUploadButton(String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.upload),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
      ),
    );
  }

  void _showDeleteConfirmationDialog(String id, String nombre) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID _ $id',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Nombre del platillo: $nombre'),
              const Text(
                  'Categoría: Comida'), // Asume que es comida, ajusta según necesites
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/images/milanesa.jpg', // Asegúrate de tener esta imagen en tu proyecto
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '¿Deseas eliminar este platillo?',
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    // Aquí va la lógica para eliminar el platillo
                    Navigator.of(context).pop();
                  },
                  child: const Text('Sí'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
