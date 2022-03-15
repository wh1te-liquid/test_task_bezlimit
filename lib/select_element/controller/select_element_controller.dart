import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SelectElementController extends GetxController {
  final TextEditingController _textEditingController;

  SelectElementController(
      )
      : _textEditingController = TextEditingController();

  TextEditingController get textEditingController => _textEditingController;
}
