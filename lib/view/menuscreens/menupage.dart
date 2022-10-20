import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'package:trading_app/auth/firebasefunction.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/model/usermodel.dart';
import 'package:trading_app/view/login.dart';
import 'package:trading_app/view/menuscreens/changepassword.dart';
// / import 'package:trading_app/view/adduser.dart';
// import 'package:trading_app/view/bankdetails.dart';
// import 'package:trading_app/view/contact.dart';
import 'package:trading_app/view/menuscreens/team.dart';
import 'package:trading_app/view/profile.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../helper/fuctions.dart';
import 'adduser.dart';
import 'bankdetails.dart';
import 'contact.dart';
import 'kyc.dart';
import 'roipage.dart';
import 'terms.dart';
import 'investment.dart';

class MenuPage extends StatelessWidget {
  final Usermodel usermodel;
  final User firebaseuser;
  const MenuPage({
    Key? key,
    required this.firebaseuser,
    required this.usermodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Uri url = Uri.parse('https://play.google.com/store/apps');

    Widget cardview(IconData icon, String text, Widget child) {
      return GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => child)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          height: height * 0.1,
          width: width,
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                text,
                style: h2(),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
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
              Expanded(
                child: SingleChildScrollView(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(
                              Icons.person,
                              'Profile',
                              Profile(
                                isHomepage: false,
                                usermodel: usermodel,
                                firebaseuser: firebaseuser,
                              )),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(Icons.people_alt, 'My Team', const Team()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(Icons.inventory_sharp, 'My Investment',
                              const Investment()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(
                              Icons.attach_money,
                              'ROI Income',
                              const RoiPage(
                                isHomepage: false,
                              )),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(
                              Icons.person_add, 'Add User', const AddUser()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(Icons.person_pin_rounded, 'KYC Update',
                              const KycUpdate()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(Icons.description_sharp, 'Bank Details',
                              const BankDetails()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(Icons.contact_page_outlined, 'Contact Us',
                              const ContactUs()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(Icons.file_copy, 'Terms & Conditions',
                              const Terms()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Share.share(
                                  'Hey Check out this app in Appstore and Playstore\n \n$url');
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              height: height * 0.1,
                              width: width,
                              child: Row(
                                children: [
                                  const Icon(Icons.share),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    'Share',
                                    style: h2(),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          cardview(Icons.lock, 'Change Password',
                              const ChangePassword()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                              onTap: (() {
                                FirebaseFunction.signoutfunc();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const Login()),
                                    (Route<dynamic> route) => false);
                              }),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                height: height * 0.1,
                                width: width,
                                child: Row(
                                  children: [
                                    const Icon(Icons.logout),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    Text(
                                      'Logout',
                                      style: h2(),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
