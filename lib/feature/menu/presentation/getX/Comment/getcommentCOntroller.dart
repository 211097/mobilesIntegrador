import 'package:get/get.dart';
import 'package:sazzon/feature/coment/domain/usecase/get_Coment_usecase.dart';
import 'package:sazzon/feature/menu/presentation/getX/Comment/getcomment_event.dart';
import 'package:sazzon/feature/menu/presentation/getX/Comment/getcomment_state.dart';


class GetCommentController extends GetxController {
  final GetCommentUseCase getCommentUseCase;
  var state = Rx<CreateGetState>(CommentInitial());
  GetCommentController({required this.getCommentUseCase});
  fetchCoDetails(FetchCommentDetailsEvent event) async {
    state.value = CommentLoading();
    try {
      var userDetails = await getCommentUseCase.execute(event.id);
      state.value = PostsLoaded(userDetails);
      print("Detalles del usuario obtenidos");
    } catch (e) {
      state.value = CommentFetchingFailure(e.toString());
    }
  }
}
