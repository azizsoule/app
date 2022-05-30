import 'package:app/core/repository/repository.dart';
import 'package:app/features/post/domain/entities/post.dart';

abstract class IPostRepository extends Repository<Post, int> {}
