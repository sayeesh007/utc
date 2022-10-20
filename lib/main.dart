// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/auth/firebasefunction.dart';

// import 'package:trading_app/mainpage.dart';
import 'package:trading_app/view/homepage.dart';
import 'package:trading_app/view/login.dart';
// import 'package:trading_app/view/menuscreens/changepassword.dart';
// / import 'package:trading_app/mainpage.dart';
// import 'package:trading_app/view/adduser.dart';
// import 'package:trading_app/view/bankdetails.dart';
// import 'package:trading_app/view/homepage.dart';
// import 'package:trading_app/view/kyc.dart';
// import 'package:trading_app/view/login.dart';
// import 'package:trading_app/view/menupage.dart';
// import 'package:trading_app/view/menuscreens/kyc.dart';
// import 'package:trading_app/view/menuscreens/menupage.dart';
// import 'package:trading_app/view/profile.dart';
// import 'package:trading_app/view/profile.dart';

// import 'package:trading_app/view/roipage.dart';
// import 'package:trading_app/view/signup.dart';
// import 'package:trading_app/view/team.dart';
// import 'package:trading_app/view/transaction.dart';
import 'helper/constants.dart';
import 'model/usermodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? currentuser = FirebaseAuth.instance.currentUser;
  if (currentuser != null) {
    Usermodel? thisUserModel =
        await FirebaseFunction.getUserModelById(currentuser.email);

    runApp(MyAppLoggedIn(firebaseuser: currentuser, usermodel: thisUserModel!));
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trading',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Paints.backgroundcolor,
            fontFamily: 'Roboto'),
        home: const Login());
  }
}

class MyAppLoggedIn extends StatelessWidget {
  final Usermodel usermodel;
  final User firebaseuser;
  const MyAppLoggedIn({
    Key? key,
    required this.usermodel,
    required this.firebaseuser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trading',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Paints.backgroundcolor,
            fontFamily: 'Roboto'),
        home: HomePage(
          usermodel: usermodel,
          firebaseuser: firebaseuser,
        ));
  }
}
