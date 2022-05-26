import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppPages {
  AppPages._();

  static const String home = "/";

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => Container(),
    ),
  ];
}
