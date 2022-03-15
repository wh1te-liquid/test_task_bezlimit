import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_bezlimit/select_element/bindings/select_element_bindings.dart';
import 'package:test_task_bezlimit/select_element/view/select_element_screen.dart';

class HomeScreenController extends GetxController {
  RxDouble angle = 0.0.obs;
  double offset = 0.0;
  int? currentIndex;
  final int _elementsCount = 5;
  final double _widthOfContainer = 100;
  final ScrollController _scrollController;

  List<Widget> getElements({int? currentIndex}) {
    return List.generate(
      _elementsCount,
          (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GestureDetector(
          onTap: () => Get.to(
                  () => SelectElementScreen(
                maxLength: _elementsCount,
                currentElementIndex: index,
              ),
              binding: SelectElementBindings()),
          child: Container(
            height: widthOfContainer,
            width: widthOfContainer,
            decoration: BoxDecoration(
                color: currentIndex == null
                    ? null
                    : currentIndex == index
                    ? Colors.yellow
                    : null,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black, width: 1)),
          ),
        ),
      ),
    );
  }

  HomeScreenController() : _scrollController = ScrollController();

  double get widthOfContainer => _widthOfContainer;

  ScrollController get scrollController => _scrollController;
}
