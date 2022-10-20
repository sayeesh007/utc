import 'package:flutter/material.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/fuctions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const CustomButton({
    Key? key,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(colors: [
            Paints.purple,
            Paints.voilet,
            Paints.blue,
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: Center(
          child: Text(
            text,
            style: h1(),
          ),
        ),
      ),
    );
  }
}
