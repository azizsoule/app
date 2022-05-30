import 'package:app/features/post/presentation/controllers/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
