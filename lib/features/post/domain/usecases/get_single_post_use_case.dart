import 'package:app/core/error/failures.dart';
import 'package:app/core/usecase/usecase.dart';
import 'package:app/features/post/domain/entities/post.dart';
import 'package:app/features/post/domain/repositories/post_repository_interface.dart';
import 'package:dartz/dartz.dart';

class GetSinglePostUseCase extends UseCase<Post, int> {
  final IPostRepository _postRepository;

  GetSinglePostUseCase(this._postRepository);

  @override
  Future<Either<Failure, Post>> call(int params) async {
    return _postRepository.getById(params);
  }
}
