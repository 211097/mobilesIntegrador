import 'package:sazzon/feature/menu/data/models/menu_models.dart';

abstract class CreateGetState {}

class MenuInitial extends CreateGetState {}

class MenuLoading extends CreateGetState {}
class PostsLoaded extends CreateGetState {
  final List<MenuModel> posts;

  PostsLoaded(this.posts);
}


class MenuFetchingFailure extends CreateGetState {
  final String error;

  MenuFetchingFailure(this.error);
}