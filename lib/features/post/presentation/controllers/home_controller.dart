import 'package:app/core/usecase/usecase.dart';
import 'package:app/features/post/domain/entities/post.dart';
import 'package:app/features/post/domain/usecases/get_all_post_use_case.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<Post>> {
  final GetAllPostsUseCase _allPostsUseCase = Get.find();

  @override
  void onReady() {
    getPosts();
    super.onReady();
  }

  void getPosts() async {
    change(null, status: RxStatus.loading());
    final eitherPosts = await _allPostsUseCase(NoParams());
    eitherPosts.fold(
      (l) {
        change(null, status: RxStatus.error());
      },
      (r) {
        change(r, status: RxStatus.success());
      },
    );
  }
}
