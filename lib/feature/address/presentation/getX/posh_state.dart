abstract class CreatePostState {}

class AddressInitial extends CreatePostState {}

class AddressLoading extends CreatePostState {}

class AddressCreatedSuccessfully extends CreatePostState {}

class AddressCreationFailure extends CreatePostState {
  final String error;
  AddressCreationFailure(this.error);
}