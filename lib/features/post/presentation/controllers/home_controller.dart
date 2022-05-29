import 'package:app/core/usecase/usecase.dart';
import 'package:app/features/post/domain/usecases/get_all_post_use_case.dart';
import 'package:app/features/post/presentation/states/post_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<PostState> {
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
        change(PostState(null, l), status: RxStatus.error(l.message));
      },
      (r) {
        change(PostState(r, null), status: RxStatus.success());
      },
    );
  }
}
