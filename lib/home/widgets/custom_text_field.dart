import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double _width;

  const CustomTextField({Key? key, required double width})
      : _width = width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.only(left: 10, bottom: 8),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
