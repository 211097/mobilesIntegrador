import 'package:sazzon/feature/address/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel({
    String? id,
    required int userId,
    required String calle,
    required int postcode,
    required String colonia,
    required int num_ext,
    required int num_int,
    required String estado,
    required String ciudad,
    required String descripcion,
  }) : super(
            id: id,
            userId: userId,
            calle: calle,
            postcode: postcode,
            colonia: colonia,
            num_ext: num_ext,
            num_int: num_int,
            estado: estado,
            ciudad: ciudad,
            descripcion: descripcion);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id']?.toString() ?? '',
      userId: json['userId'] ?? 0,
      postcode: json['postcode'] ?? 0,
      calle: json['calle'] ?? '',
      colonia: json['colonia'] ?? '',
      num_ext: json['num_ext'] ?? 0,
      num_int: json['num_int'] ?? 0,
      estado: json['estado'] ?? '',
      ciudad: json['ciudad'] ?? '',
      descripcion: json['descripcion'] ?? '',
    );
  }

  factory AddressModel.fromEntity(Address address) {
    return AddressModel(
      id: address.id,
      userId: address.userId,
      postcode: address.postcode,
      calle: address.calle,
      colonia: address.colonia,
      num_ext: address.num_ext,
      num_int: address.num_int,
      estado: address.estado,
      ciudad: address.ciudad,
      descripcion: address.descripcion,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'postcode': postcode,
      'calle': calle,
      'colonia': colonia,
      'num_ext': num_ext,
      'num_int': num_int,
      'estado': estado,
      'ciudad': ciudad,
      'descripcion': descripcion,
    };
  }
}
