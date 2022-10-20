import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/uihelper.dart';
import 'package:trading_app/model/usermodel.dart';
import 'package:trading_app/view/homepage.dart';
import 'package:trading_app/view/menuscreens/menupage.dart';
import 'package:trading_app/widgets/custombutton.dart';

import '../helper/fuctions.dart';

class EditProfile extends StatefulWidget {
  final Usermodel usermodel;
  final User firebaseuser;
  const EditProfile({
    Key? key,
    required this.usermodel,
    required this.firebaseuser,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool submitted = false;
  final TextEditingController sponserid = TextEditingController();

  final TextEditingController phoneno = TextEditingController();

  final TextEditingController gender = TextEditingController();

  final TextEditingController city = TextEditingController();

  final TextEditingController dob = TextEditingController();

  final TextEditingController dateofjoin = TextEditingController();
  @override
  void dispose() {
    sponserid.dispose();
    phoneno.dispose();
    gender.dispose();
    city.dispose();
    dob.dispose();
    dateofjoin.dispose();
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
                    'Profile Details',
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
                cardtextfeild(phoneno, 'Phone No'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(gender, 'Gender'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(city, 'Address'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(dob, 'Date of Birth'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(dateofjoin, 'Date of Joining'),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButton(
                      text: "Submit",
                      ontap: () async {
                        UiHelper.showLoadingDialog(context, 'Loading');
                        String? email =
                            FirebaseAuth.instance.currentUser!.email;
                        try {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(email)
                              .collection('profile')
                              .doc('profiledetails')
                              .set({
                            'Sponser Id': sponserid.text,
                            'Phone No': phoneno.text,
                            'Gender': gender.text,
                            'City': city.text,
                            "Dob": dob.text,
                            'Date of joining': dateofjoin.text,
                          }).then((value) {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage(
                                    firebaseuser: widget.firebaseuser,
                                    usermodel: widget.usermodel)));
                          });
                        } on FirebaseException catch (e) {
                          Navigator.of(context).pop();
                          UiHelper.showErrorDialog(context,
                              e.message.toString(), 'An Error Occured');
                        }
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
