import 'package:app/core/error/failures.dart';
import 'package:app/core/states.dart/app_state.dart';
import 'package:app/features/post/domain/entities/post.dart';

class PostState extends AppState<List<Post>, Failure> {
  const PostState(List<Post>? data, Failure? error)
      : super(
          data: data,
          error: error,
        );
}
