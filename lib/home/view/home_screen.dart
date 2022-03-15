import 'dart:math';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_task_bezlimit/home/controller/home_screen_controller.dart';
import 'package:test_task_bezlimit/home/widgets/custom_text_field.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildBottomSheet({
    required ScrollController scrollController,
    required double bottomSheetOffset,
  }) {
    return Material(
      child: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextField(
                          width: Get.size.width * 0.75,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          width: Get.size.width * 0.85,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          width: Get.size.width * 0.6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                        height: 100,
                        child: GetBuilder(
                          builder: (HomeScreenController controller) => ListView(
                            controller: controller.scrollController,
                            scrollDirection: Axis.horizontal,
                            children: controller.getElements(
                                currentIndex: controller.currentIndex),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Obx(
              () => Transform.rotate(
                  angle: controller.angle.value * pi / 180,
                  child: SvgPicture.asset(
                    'assets/icons/circle.svg',
                    fit: BoxFit.scaleDown,
                  )),
            ),
            transform: Matrix4.translationValues(
                Get.size.width * -0.5, Get.size.height * -0.5, 0.0),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () => showFlexibleBottomSheet(
                      minHeight: 0.5,
                      initHeight: 0.5,
                      maxHeight: 1,
                      context: context,
                      builder: (context, scrollController, offset) {
                        Future.delayed(const Duration(milliseconds: 1)).then(
                          (_) {
                            if (offset != 0.5) {
                              controller.angle.value +=
                                  (controller.offset > offset ? 1 : -1) * 3;
                            }
                            if (offset == 1 && controller.offset != 1) {
                              Get.snackbar(
                                "Поздравляю",
                                "Вы достигли самой вершины",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.grey,
                              );
                            }
                            controller.offset = offset;
                          },
                        );
                        return _buildBottomSheet(
                          bottomSheetOffset: offset,
                          scrollController: scrollController,
                        );
                      },
                      anchors: [0, 0.5, 1],
                    ),
                child: const Text('Жми')),
          )
        ],
      ),
    );
  }
}
