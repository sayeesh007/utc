import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:trading_app/model/usermodel.dart';
import 'package:trading_app/view/homepage.dart';
import 'package:trading_app/view/login.dart';

class MainPage extends StatelessWidget {
  final Usermodel usermodel;
  final User firebaseuser;
  const MainPage({
    Key? key,
    required this.usermodel,
    required this.firebaseuser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage(
              usermodel: usermodel,
              firebaseuser: FirebaseAuth.instance.currentUser!,
            );
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
