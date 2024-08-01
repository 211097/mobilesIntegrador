import 'package:sazzon/feature/coment/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel({
    super.id,
    required super.id_platillo,
    required super.id_user,
    required super.comentario,
    required super.calificacion,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      id_platillo: json['id_platillo'],
      id_user: json['id_user'],
      comentario: json['comentario'],
      calificacion: (json['calificacion'] is String)
          ? double.tryParse(json['calificacion']) ?? 0.0
          : (json['calificacion'] ?? 0.0),
    );
  }

  factory CommentModel.fromEntity(Comment comment) {
    return CommentModel(
      id: comment.id,
      id_platillo: comment.id_platillo,
      id_user: comment.id_user,
      comentario: comment.comentario,
      calificacion: comment.calificacion,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_platillo': id_platillo,
      'id_user': id_user,
      'comentario': comentario,
      'calificacion': calificacion,
    };
  }
}
