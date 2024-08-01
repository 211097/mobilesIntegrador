

import 'package:sazzon/feature/coment/data/models/comment_models.dart';

abstract class CreatePostEvent {}

class CreateCommentEvent extends CreatePostEvent {
  final CommentModel commentModel;



  CreateCommentEvent(  this.commentModel);
}
