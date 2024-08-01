import 'package:sazzon/feature/menu/domain/entities/menu.dart';
class MenuModel extends Menu {
  MenuModel({
     super.id,
    required super.nombre_platillo,
    required super.descripcion,
    required super.precio,
    required super.imagen,
    required super.categoria,
     super.ingredientes
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
     nombre_platillo: json['nombre_platillo'],
    descripcion:json['descripcion'],
    precio:json['precio'],
    categoria: json['categoria'],
    imagen:json['imagen'],
    ingredientes:json['ingredientes'],
    );
  }


  factory MenuModel.fromEntity(Menu menu) {
    return MenuModel(
      id: menu.id,
       nombre_platillo: menu.nombre_platillo,
    descripcion:menu.descripcion,
    precio: menu.precio,
    categoria: menu.categoria,
    imagen:menu.imagen,
    ingredientes:menu.ingredientes
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre_platillo': nombre_platillo,
      'descripcion': descripcion,
      'precio': precio,
      'categoria': categoria,
      'imagen':imagen,
      'ingredientes':ingredientes
    };
  }
}
