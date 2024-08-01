// createpost_state.dart

abstract class CreatePostState {}

class CommentInitial extends CreatePostState {}

class CommentLoading extends CreatePostState {}

class CommentCreatedSuccessfully extends CreatePostState {}

class CommentCreationFailure extends CreatePostState {
  final String error;
  CommentCreationFailure(this.error);
}