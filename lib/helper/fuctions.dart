import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/helper/constants.dart';

LinearGradient maingradient() {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Paints.blue, Paints.purple, Paints.voilet]);
}

TextStyle tittle() {
  return const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
}

TextStyle h1() {
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

TextStyle h2() {
  return const TextStyle(
    fontSize: 16,
  );
}

TextStyle normal() {
  return const TextStyle(
    fontSize: 14,
  );
}

SizedBox topwave() {
  return SizedBox(
    height: 150,
    width: double.infinity,
    child: Image.asset(
      'assets/images/top wave.png',
      fit: BoxFit.fill,
    ),
  );
}

// SizedBox bottomwave() {
//   return SizedBox(
//     height: 150,
//     width: double.infinity,
//     child: Image.asset(
//       'assets/images/top wave.png',
//       fit: BoxFit.fill,
//     ),
//   );
// }

Widget cardtextfeild(controller, text) {
  return Center(
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: FractionallySizedBox(
          // widthFactor: 0.8,
          // heightFactor: 0.07,
          child: Container(
            // height: height * 0.08,
            // width: width * 0.8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Paints.purple.withOpacity(0.3),
                  Paints.blue.withOpacity(0.3),
                  // Colors.white.withOpacity(0.4),
                  // Colors.white.withOpacity(0.2),
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                hintStyle: normal(),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
