import 'package:sazzon/feature/address/data/models/address_models.dart';

abstract class CreateGetState {}

class AddressInitial extends CreateGetState {}

class AddressLoading extends CreateGetState {}

class PostsLoaded extends CreateGetState {
  final List<AddressModel> posts;

  PostsLoaded(this.posts);
}

class AddressFetchingFailure extends CreateGetState {
  final String error;

  AddressFetchingFailure(this.error);
}