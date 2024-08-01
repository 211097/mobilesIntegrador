import 'package:sazzon/feature/coment/data/datasource/Comment_api_data_source.dart';
import 'package:sazzon/feature/coment/data/repositories/comment_repository_implement.dart';
import 'package:sazzon/feature/coment/domain/usecase/get_Coment_usecase.dart';
import 'package:sazzon/feature/coment/domain/usecase/posh_Coment_usecase.dart';

class CommentcaseConfig {
  CommentApiDataSourceImp? commentApiDataSourceImp;
  CommentRepositoryImp? commentRepositoryImp;
  PoshcommentUseCase? poshcommentUseCase;
  GetCommentUseCase? getCommentUseCase;

  CommentcaseConfig() {
    commentApiDataSourceImp = CommentApiDataSourceImp();
    commentRepositoryImp = CommentRepositoryImp(commentApiDataSource: commentApiDataSourceImp!);
    poshcommentUseCase = PoshcommentUseCase(commentRepositoryImp!);
    getCommentUseCase = GetCommentUseCase(commentRepositoryImp!);
  }
}
