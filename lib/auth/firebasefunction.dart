import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:trading_app/helper/uihelper.dart';
import 'package:trading_app/model/profilemodel.dart';
import 'package:trading_app/model/usermodel.dart';
import 'package:trading_app/view/profile.dart';

class FirebaseFunction {
  static Future loginfunc(email, password, BuildContext context) async {
    UiHelper.showLoadingDialog(context, 'Logging In.....');
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      UiHelper.showErrorDialog(
          context, e.message.toString(), 'An Error Occured');
    }
  }

  static Future adduser(
    context,
    email,
    password,
    firstname,
    lastname,
    mobileno,
    sponserid,
  ) async {
    UiHelper.showLoadingDialog(context, 'Adding User');
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance.collection('users').doc(email).set({
        'Sponser Id': sponserid,
        'First Name': firstname,
        'Last Name': lastname,
        'Mobie No': mobileno,
        'Email Id': email,
        'Password': password
      });
      Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      UiHelper.showErrorDialog(
          context, e.message.toString(), 'An Error Occured');
    }
  }

  static Future createUser(
    context,
    email,
    password,
    firstname,
    lastname,
    mobileno,
    sponserid,
  ) async {
    UiHelper.showLoadingDialog(context, 'Creating User');
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      UiHelper.showErrorDialog(
          context, e.message.toString(), 'An Error Occured');
    }
    await FirebaseFirestore.instance.collection('users').doc(email).set({
      'Sponser Id': sponserid,
      'First Name': firstname,
      'Last Name': lastname,
      'Mobie No': mobileno,
      'Email Id': email,
      'Password': password
    });
  }

  static Future forgotpassword(email, context) async {
    UiHelper.showLoadingDialog(context, 'Loading');
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) => Navigator.of(context).pop());
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      UiHelper.showErrorDialog(
          context, e.message.toString(), 'An Error Occured');
    }
  }

  static Future signoutfunc() async {
    await FirebaseAuth.instance.signOut().then((value) => null);
  }

  static Future<Usermodel?> getUserModelById(String? uid) async {
    Usermodel? userModel;
    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (docSnap.data() != null) {
      userModel = Usermodel.fromMap(docSnap.data() as Map<String, dynamic>);
    }
    return userModel;
  }

  static Future<ProfileModel?> getprofileById(String? uid) async {
    ProfileModel? profileModel;
    DocumentSnapshot docSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('profile')
        .doc('profiledetails')
        .get();
    if (docSnap.data() != null) {
      profileModel =
          ProfileModel.fromMap(docSnap.data() as Map<String, dynamic>);
    }
    return profileModel;
  }
}
