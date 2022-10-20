import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:trading_app/auth/firebasefunction.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/fuctions.dart';
import 'package:trading_app/model/profilemodel.dart';
import 'package:trading_app/view/editprofile.dart';

import '../model/usermodel.dart';

class Profile extends StatefulWidget {
  final bool isHomepage;
  final Usermodel usermodel;
  final User firebaseuser;
  const Profile({
    Key? key,
    required this.isHomepage,
    required this.usermodel,
    required this.firebaseuser,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

ProfileModel? profileModel;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    profiledata();
    super.initState();
  }

  void profiledata() async {
    profileModel =
        await FirebaseFunction.getprofileById(widget.usermodel.email);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/wallpaper.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 150,
                //   width: size.width,
                //   child: Image.asset(
                //     'assets/images/top wave.png',
                //     fit: BoxFit.fill,
                //   ),

                // ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        widget.isHomepage
                            ? const SizedBox()
                            // ? GestureDetector(
                            //     onTap: () async {
                            //       // Navigator.of(context).push(MaterialPageRoute(
                            //       //     builder: (context) => const MenuPage()));
                            //     },
                            //     // child: SizedBox(
                            //     //     height: 50.0,
                            //     //     width: 50.0,
                            //     //     child:
                            //     //         Image.asset('assets/icons/menu.png')),
                            //   )
                            : GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: SizedBox(
                                    height: 50.0,
                                    width: 50.0,
                                    child:
                                        Image.asset('assets/icons/back.png')),
                              ),
                        const Spacer(),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditProfile(
                                      usermodel: widget.usermodel,
                                      firebaseuser: widget.firebaseuser,
                                    )));
                          },
                          style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              shape: const StadiumBorder(),
                              side:
                                  BorderSide(width: 3.0, color: Paints.voilet),
                              textStyle: h1()),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Edit Pofile',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 60),
                        padding: const EdgeInsets.only(bottom: 15),
                        width: width * 0.8,
                        height: height * .2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Paints.purple.withOpacity(0.4),
                              Paints.blue.withOpacity(0.4),
                              // Colors.white.withOpacity(0.4),
                              // Colors.white.withOpacity(0.2),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: ClipRRect(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${widget.usermodel.firstname} ${widget.usermodel.lastname}",
                                style: h1(),
                              ),
                              Text(
                                "${widget.usermodel.email}",
                                style: h2(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 20,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Paints.purple),
                          child: const Icon(
                            Icons.person,
                            size: 50,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Paints.purple.withOpacity(0.4),
                        Paints.blue.withOpacity(0.4),
                        // Colors.white.withOpacity(0.4),
                        // Colors.white.withOpacity(0.2),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  width: width * 0.8,
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Sponser Id",
                            textAlign: TextAlign.justify,
                            style: h2(),
                          ),
                          const Spacer(),
                          Text(
                            "${widget.usermodel.sponserid}",
                            textAlign: TextAlign.justify,
                            style: normal(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Phone No",
                            textAlign: TextAlign.justify,
                            style: h2(),
                          ),
                          const Spacer(),
                          Text(
                            profileModel?.phoneno ?? '',
                            textAlign: TextAlign.justify,
                            style: normal(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Gender",
                            textAlign: TextAlign.justify,
                            style: h2(),
                          ),
                          const Spacer(),
                          Text(
                            profileModel?.gender ?? '',
                            textAlign: TextAlign.justify,
                            style: normal(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "City",
                            textAlign: TextAlign.justify,
                            style: h2(),
                          ),
                          const Spacer(),
                          Text(
                            profileModel?.city ?? '',
                            textAlign: TextAlign.justify,
                            style: normal(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Date of Birth",
                            style: h2(),
                          ),
                          const Spacer(),
                          Text(
                            profileModel?.dob ?? '',
                            style: normal(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Date of Joining",
                            style: h2(),
                          ),
                          const Spacer(),
                          Text(
                            profileModel?.dateofjoin ?? '',
                            style: normal(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // SizedBox(
                //     width: width * 0.6,
                //     child: CustomButton(text: 'Edit Profile', ontap: () {}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
