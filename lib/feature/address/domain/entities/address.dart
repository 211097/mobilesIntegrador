
class Address {
  String? id;
  final int userId;
  final String calle;
  final int postcode;
  final String colonia;
  final int num_ext;
  final int num_int;
  final String estado;
  final String ciudad;
  final String descripcion;

  Address({
    this.id,
    required this.userId,
    required this.calle,
    required this.postcode,
    required this.colonia,
    required this.num_ext,
    required this.num_int,
    required this.estado,
    required this.ciudad,
    required this.descripcion,
  });
}
