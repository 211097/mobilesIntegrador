class Menu {
  String? id;
  final String nombre_platillo;
  final String descripcion;
  final int precio;
  final String categoria;
  final String imagen;
  String? ingredientes;
  Menu(
      {this.id,
      required this.nombre_platillo,
      required this.descripcion,
      required this.precio,
      required this.categoria,
      required this.imagen,
      this.ingredientes
      });
}
