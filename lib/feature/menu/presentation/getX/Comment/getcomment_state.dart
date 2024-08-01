import 'package:sazzon/feature/coment/data/models/comment_models.dart';

abstract class CreateGetState {}

class CommentInitial extends CreateGetState {}

class CommentLoading extends CreateGetState {}
class PostsLoaded extends CreateGetState {
  final List<CommentModel> posts;

  PostsLoaded(this.posts);
}


class CommentFetchingFailure extends CreateGetState {
  final String error;

  CommentFetchingFailure(this.error);
}