import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test_task_bezlimit/home/bindings/home_screen_bindings.dart';
import 'package:test_task_bezlimit/home/view/home_screen.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: HomeScreenBindings(),
        ),
      ],
      initialRoute: '/home',
    );
  }
}