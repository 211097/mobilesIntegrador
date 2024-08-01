// createpost_state.dart

abstract class CreatePostState {}

class PasswordInitial extends CreatePostState {}

class PasswordLoading extends CreatePostState {}

class PasswordCreatedSuccessfully extends CreatePostState {}

class PasswordCreationFailure extends CreatePostState {
  final String error;
  PasswordCreationFailure(this.error);
}