import 'package:flutter/material.dart';
import 'package:trading_app/helper/fuctions.dart';

class CustomTextfeild extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CustomTextfeild({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
      width: size * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white.withOpacity(0.1)),
      child: TextField(
        controller: controller,
        obscureText: text == 'Password' ? true : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: text,
          hintStyle: normal(),
        ),
      ),
    );
  }
}
