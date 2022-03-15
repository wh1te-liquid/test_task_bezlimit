// Package imports:
import 'package:get/get.dart';
import 'package:test_task_bezlimit/home/controller/home_screen_controller.dart';


class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}
