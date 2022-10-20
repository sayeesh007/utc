import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trading_app/auth/firebasefunction.dart';
import 'package:trading_app/helper/fuctions.dart';
import 'package:trading_app/widgets/custombutton.dart';
import 'package:trading_app/widgets/customtextfeild.dart';

import '../../helper/constants.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/wallpaper.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the Registered email to get the link to reset the password',
              style: h2(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: ClipRRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Paints.purple.withOpacity(0.3),
                              Paints.blue.withOpacity(0.4),
                              // Colors.white.withOpacity(0.4),
                              // Colors.white.withOpacity(0.2),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 40.0),
                          child: CustomTextfeild(
                              text: " Enter registered email",
                              controller: controller),
                        ))),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomButton(
                text: 'Send',
                ontap: () {
                  FirebaseFunction.forgotpassword(controller.text, context);
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
