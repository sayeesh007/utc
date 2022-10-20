import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/helper/uihelper.dart';
import 'package:trading_app/widgets/custombutton.dart';

import '../../helper/constants.dart';
import '../../helper/fuctions.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final TextEditingController bankname = TextEditingController();

  final TextEditingController name = TextEditingController();

  final TextEditingController accno = TextEditingController();

  final TextEditingController ifsc = TextEditingController();
  @override
  void dispose() {
    bankname.dispose();
    name.dispose();
    accno.dispose();
    ifsc.dispose();
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
                    'Bank Details',
                    style: tittle(),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(bankname, 'Bank Name'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(name, 'Name'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(accno, 'Account Number'),
                const SizedBox(
                  height: 15.0,
                ),
                cardtextfeild(ifsc, 'IFSC code'),
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
                              .collection('bankdetails')
                              .doc('bankdetails')
                              .set({
                            'Bank Name': bankname.text,
                            'Name': name.text,
                            'Account number': accno.text,
                            'IFSC Code': ifsc.text,
                            'verified': false
                          }).then((value) => Navigator.of(context).pop());
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
