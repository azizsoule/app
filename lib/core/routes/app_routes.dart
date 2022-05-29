import 'package:app/features/post/presentation/pages/home_screen.dart';
import 'package:get/route_manager.dart';

class AppPages {
  AppPages._();

  static const String home = "/";

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
    ),
  ];
}
