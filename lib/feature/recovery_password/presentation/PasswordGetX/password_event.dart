

import 'package:sazzon/feature/user/data/models/user_models.dart';

import '../../../user/data/models/password_models.dart';

abstract class CreatePostEvent {}

class CreatepasswrodEvent extends CreatePostEvent {
  final PasswordModels password;



  CreatepasswrodEvent(this.password);
}
