import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/auth/firebasefunction.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/fuctions.dart';
import 'package:trading_app/widgets/custombutton.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget cardtextfeild(controller, text) {
      return Center(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: height * 0.08,
              width: width * 0.8,
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
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: width,
          height: height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/wallpaper.png'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset('assets/icons/back.png')),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Add User',
                    style: tittle(),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(sponserid, 'Sponser Id'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(firstname, 'First Name'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(lastname, 'Last Name'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(mobileno, 'Mobile No'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(email, 'Email Id'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(password, 'Password'),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButton(
                      text: "Add User",
                      ontap: () async {
                        String? currentemail =
                            FirebaseAuth.instance.currentUser!.email;
                        await FirebaseFunction.adduser(
                            context,
                            email.text,
                            password.text,
                            firstname.text,
                            lastname.text,
                            mobileno.text,
                            sponserid.text);
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(currentemail)
                            .collection('direct')
                            .doc(email.text)
                            .set({
                          'Sponser Id': sponserid.text,
                          'First Name': firstname.text,
                          'Last Name': lastname.text,
                          'Mobie No': mobileno.text,
                          'Email Id': email.text,
                          'Password': password.text
                        }).then((value) => Navigator.of(context).pop());
                      }),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
