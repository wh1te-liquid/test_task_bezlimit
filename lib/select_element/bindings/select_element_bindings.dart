// Package imports:
import 'package:get/get.dart';
import 'package:test_task_bezlimit/select_element/controller/select_element_controller.dart';


class SelectElementBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectElementController());
  }
}
