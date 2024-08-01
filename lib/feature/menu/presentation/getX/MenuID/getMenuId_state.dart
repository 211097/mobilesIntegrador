import 'package:sazzon/feature/menu/data/models/menu_models.dart';

abstract class GetIdState {}

class MenuIDInitial extends GetIdState {}

class MenuIDLoading extends GetIdState {}
class GetIdLoaded extends GetIdState {
  final List<MenuModel> posts;

  GetIdLoaded(this.posts);
}


class MenuFetchingFailure extends GetIdState {
  final String error;

  MenuFetchingFailure(this.error);
}