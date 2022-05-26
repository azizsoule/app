import 'package:app/core/error/failures.dart';
import 'package:app/core/usecase/usecase.dart';
import 'package:app/features/post/domain/entities/post.dart';
import 'package:app/features/post/domain/repositories/post_repository_interface.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase extends UseCase<List<Post>, NoParams> {
  final IPostRepository _postRepository;

  GetAllPostsUseCase(this._postRepository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await _postRepository.getAll();
  }
}
