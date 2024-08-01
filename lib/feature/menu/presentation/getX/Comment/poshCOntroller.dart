import 'package:get/get.dart';
import 'package:sazzon/feature/coment/domain/usecase/posh_Coment_usecase.dart';
import 'package:sazzon/feature/menu/presentation/getX/Comment/posh_event.dart';
import 'package:sazzon/feature/menu/presentation/getX/Comment/posh_state.dart';


class PoshCommentController extends GetxController {
  final PoshcommentUseCase poshcommentUseCase;
  var state = Rx<CreatePostState>(CommentInitial());
  PoshCommentController({required this.poshcommentUseCase});
  createComment(CreateCommentEvent event) async {
    state.value = CommentLoading();
    try {
      await poshcommentUseCase.execute(event.commentModel);
      print("object");
      state.value = CommentCreatedSuccessfully();
    } catch (e) {
      state.value = CommentCreationFailure(e.toString());
    }
  }
}