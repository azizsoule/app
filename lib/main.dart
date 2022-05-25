import 'package:app/core/constants/app_constants.dart';
import 'package:app/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appTitle,
      initialRoute: AppPages.home,
      getPages: AppPages.pages,
    );
  }
}