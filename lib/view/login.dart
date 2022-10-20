import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/auth/firebasefunction.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/fuctions.dart';
import 'package:trading_app/helper/uihelper.dart';
import 'package:trading_app/model/usermodel.dart';
import 'package:trading_app/view/homepage.dart';
import 'package:trading_app/view/signup.dart';
import 'package:trading_app/widgets/custombutton.dart';
import 'package:trading_app/widgets/customtextfeild.dart';
// import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();
  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizedBox login = SizedBox(
      width: size.width * .8,
      height: size.height * .45,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Paints.purple.withOpacity(0.3),
                Paints.blue.withOpacity(0.3),
              ],
              begin: AlignmentDirectional.bottomEnd,
              end: AlignmentDirectional.topStart,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 20.0,
              // ),
              const Spacer(),
              Text(
                'Login',
                style: tittle(),
              ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              const Spacer(),
              CustomTextfeild(text: 'Username', controller: username),
              const SizedBox(
                height: 15.0,
              ),
              CustomTextfeild(text: 'Password', controller: password),
              const Spacer(),
              Center(
                  child: CustomButton(
                      text: 'Sign Up',
                      ontap: () async {
                        try {
                          FirebaseFunction.loginfunc(
                                  username.text, password.text, context)
                              .then((value) async {
                            String? email =
                                FirebaseAuth.instance.currentUser!.email;
                            DocumentSnapshot userData = await FirebaseFirestore
                                .instance
                                .collection('users')
                                .doc(email)
                                .get();
                            Usermodel usermodel = Usermodel.fromMap(
                                userData.data() as Map<String, dynamic>);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage(
                                      usermodel: usermodel,
                                      firebaseuser:
                                          FirebaseAuth.instance.currentUser!,
                                    )));
                          });
                        } on FirebaseException catch (err) {
                          log(err.toString());
                        }
                      })),
              const Spacer(),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: normal(),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Signup()));
                      }),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 14,
                            color: Paints.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(
        body: SizedBox(
      // color: Colors.amber,
      width: size.width,
      height: size.height,
      child: Stack(
        // alignment: Alignment.center,
        children: [
          SizedBox(
              width: size.width,
              height: 150,
              child: Image.asset(
                'assets/images/top wave.png',
                fit: BoxFit.fill,
              )),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
                      child: login),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: 80,
              child: Image.asset(
                'assets/images/wave 2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
