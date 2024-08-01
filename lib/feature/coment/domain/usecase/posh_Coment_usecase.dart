import 'package:sazzon/feature/coment/data/models/comment_models.dart';
import 'package:sazzon/feature/coment/domain/repository/comment_repository.dart';



class PoshcommentUseCase {
  final CommentRepository commentRepository;
  PoshcommentUseCase(this.commentRepository);

  Future<void> execute(CommentModel commentModel,

  ) async {
    try {
      await commentRepository.PoshComment(commentModel);

    } catch (e,stackTrace) {
      print('Error during user registration: $e');
      print('StackTrace: $stackTrace');
      rethrow;
    }
  }

}