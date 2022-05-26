import 'package:app/features/post/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state?.length ?? 0,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(state?[index].title ?? ""),
            subtitle: Text(state?[index].body ?? ""),
            leading: CircleAvatar(
              child: Text(state?[index].title[0].toUpperCase() ?? ""),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
        onError: (data) => Center(
          child: MaterialButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: controller.getPosts,
            child: const Text(
              "Réessayer",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
