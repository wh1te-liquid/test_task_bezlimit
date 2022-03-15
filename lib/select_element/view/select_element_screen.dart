import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_bezlimit/home/controller/home_screen_controller.dart';
import 'package:test_task_bezlimit/select_element/controller/select_element_controller.dart';

class SelectElementScreen extends StatelessWidget {
  final SelectElementController _controller =
      Get.find<SelectElementController>();
  final HomeScreenController _homeScreenController =
      Get.find<HomeScreenController>();
  final int _maxIndex;
  final int _currentElementIndex;

  SelectElementScreen({
    Key? key,
    required int maxLength,
    required int currentElementIndex,
  })  : _maxIndex = maxLength,
        _currentElementIndex = currentElementIndex,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller.textEditingController,
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: (_currentElementIndex + 1).toString()),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                if (_controller.textEditingController.text.isNotEmpty) {
                  final parsedText =
                      int.parse(_controller.textEditingController.text);
                  if (parsedText > _maxIndex || parsedText == 0) {
                    _controller.textEditingController.clear();
                  } else {
                    final int elementIndex = parsedText - 1;
                    _homeScreenController.scrollController.jumpTo(
                        (elementIndex *
                                _homeScreenController.widthOfContainer) +
                            (elementIndex * 16) -
                            100);
                    _homeScreenController.currentIndex = elementIndex;
                    Get.back();
                    _homeScreenController.update();
                  }
                }
              },
              child: const Text('Сохранить'))
        ],
      ),
    );
  }
}
