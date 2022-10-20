import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/auth/firebasefunction.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/fuctions.dart';
import 'package:trading_app/model/usermodel.dart';
import 'package:trading_app/view/homepage.dart';
import 'package:trading_app/view/login.dart';
import 'package:trading_app/widgets/custombutton.dart';
import 'package:trading_app/widgets/customtextfeild.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController sponserid = TextEditingController();

  final TextEditingController firstname = TextEditingController();

  final TextEditingController lastname = TextEditingController();

  final TextEditingController mobileno = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    sponserid.dispose();
    firstname.dispose();
    lastname.dispose();
    mobileno.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SizedBox signup = SizedBox(
      width: width * 0.8,
      height: height * 0.7,
      child: Container(
        padding:
            const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Paints.purple.withOpacity(0.3),
                Paints.blue.withOpacity(0.3),
              ],
              begin: AlignmentDirectional.bottomEnd,
              end: AlignmentDirectional.topStart,
            ),
            // color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: tittle(),
              ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              const Spacer(),
              CustomTextfeild(text: 'Sponser Id', controller: sponserid),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextfeild(text: 'First Name', controller: firstname),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextfeild(text: 'Last Name', controller: lastname),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextfeild(text: 'Mobile No', controller: mobileno),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextfeild(text: 'E-mail id', controller: email),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextfeild(text: 'Password', controller: password),
              const Spacer(),
              Center(
                  child: CustomButton(
                      text: 'Sign Up',
                      ontap: () async {
                        if (sponserid.text.trim() == null &&
                            firstname.text == null &&
                            lastname.text.trim() == null &&
                            email.text == null &&
                            mobileno.text == null) {
                          print('fill sponser id');
                        } else if (password.text == null &&
                            password.text.length < 6) {
                          print('password should be atleast 6 letter');
                        } else {
                          // String? uid = FirebaseAuth.instance.currentUser.uid;
                          Usermodel newuser = Usermodel(
                              sponserid: sponserid.text,
                              firstname: firstname.text,
                              lastname: lastname.text,
                              email: email.text,
                              mobileno: mobileno.text);
                          await FirebaseFunction.createUser(
                              context,
                              email.text.trim(),
                              password.text.trim(),
                              firstname.text.trim(),
                              lastname.text.trim(),
                              mobileno.text.trim(),
                              sponserid.text.trim());

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(
                                    usermodel: newuser,
                                    firebaseuser:
                                        FirebaseAuth.instance.currentUser!,
                                  )));
                          // final docuser = FirebaseFirestore.instance
                          //     .collection('user')
                          //     .doc('doc');
                          // final json = {
                          //   'Sponser Id': sponserid.text,
                          //   'First Name': firstname.text,
                          //   'Last Name': lastname.text,
                          //   'Mobie No': mobileno.text,
                          //   'Email Id': email.text,
                          //   'Password': password.text
                          // };
                          // await docuser.set(json);
                          // await FirebaseFirestore.instance
                          //     .collection('users')
                          //     .doc('mydoc')
                          //     .set({
                          //   'Sponser Id': sponserid.text,
                          //   'First Name': firstname.text,
                          //   'Last Name': lastname.text,
                          //   'Mobie No': mobileno.text,
                          //   'Email Id': email.text,
                          //   'Password': password.text
                          // });
                        }
                      })),
              const Spacer(),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already have an account?',
                      style: normal(),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Login()))),
                      child: Text(
                        'Login In',
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
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: width,
                height: 125,
                child: Image.asset(
                  'assets/images/top wave.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                top: 125,
                left: 40,
                child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: signup))),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: width,
                height: 80,
                child: Image.asset(
                  'assets/images/bottam wave.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
