

import 'package:sazzon/feature/user/data/models/user_models.dart';

abstract class CreatePostEvent {}

class CreateUserEvent extends CreatePostEvent {
  final userModel user;



  CreateUserEvent(  this.user);
}
