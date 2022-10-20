import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/helper/fuctions.dart';
import 'package:trading_app/model/usermodel.dart';
import 'package:trading_app/view/menuscreens/menupage.dart';
import 'package:trading_app/view/menuscreens/roipage.dart';
import 'package:trading_app/view/profile.dart';
// import 'package:trading_app/view/transaction.dart';

class HomePage extends StatefulWidget {
  final Usermodel usermodel;
  final User firebaseuser;
  const HomePage(
      {Key? key, required this.usermodel, required this.firebaseuser})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pagecontroller = PageController(initialPage: 1);
  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // List<IconData> iconList = [Icons.home, Icons.wallet_giftcard, Icons.person];
    // int _bottomNavIndex = 1;
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/wallpaper.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: PageView(controller: pagecontroller, children: [
            const RoiPage(
              isHomepage: true,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FirebaseFunction.signoutfunc();
                // final docuser = FirebaseFirestore.instance
                //     .collection('user')
                //     .doc('doc');
                // final json = {
                //   'Sponser Id': 1,
                //   'First Name': 1,
                //   'Last Name': 1,
                //   'Mobie No': 1,
                //   'Email Id': 1,
                //   'Password': 1
                // };
                // await docuser.set(json);
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MenuPage(
                                usermodel: widget.usermodel,
                                firebaseuser: widget.firebaseuser,
                              )));
                    },
                    child: SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset('assets/icons/menu.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, bottom: 10.0, top: 10.0),
                  child: Text(
                    "welcome ${widget.usermodel.firstname}",
                    style: tittle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Plans',
                    style: h1(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.3,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 1,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(milliseconds: 2000),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Paints.voilet.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Center(
                              child:
                                  //     Image.asset(
                                  //   'assets/images/trade$i',
                                  //   fit: BoxFit.cover,
                                  // )
                                  Text(
                                'Plan $i',
                                style: h1(),
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, bottom: 10.0, top: 20.0),
                  child: Text(
                    'Our Expertise',
                    style: h1(),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.2,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(milliseconds: 2000),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                'assets/images/trade$i.jpg',
                                width: width,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  i == 1
                                      ? 'Crypto Exchange'
                                      : i == 2
                                          ? 'Forex Trading'
                                          : i == 3
                                              ? 'Stock Market'
                                              : i == 4
                                                  ? 'Development'
                                                  : 'Commodity Trading',
                                  style: h1(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                )
              ],
            ),
            // const Transaction(),
            Profile(
              isHomepage: true,
              usermodel: widget.usermodel,
              firebaseuser: widget.firebaseuser,
            ),
          ]),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Paints.backgroundcolor.withOpacity(0.50),
        color: Paints.backgroundcolor.withOpacity(0.50),
        items: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/transaction.png',
              width: 30,
              height: 27,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/Home.png',
              width: 25,
              height: 27,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/Profile.png',
              width: 20,
              height: 27,
              fit: BoxFit.fill,
            ),
          ),
        ],
        onTap: (index) {
          pagecontroller.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}
