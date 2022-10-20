import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trading_app/helper/constants.dart';
import 'package:trading_app/widgets/custombutton.dart';

import '../../helper/fuctions.dart';
import '../../helper/uihelper.dart';

class KycUpdate extends StatefulWidget {
  const KycUpdate({Key? key}) : super(key: key);

  @override
  State<KycUpdate> createState() => _KycUpdateState();
}

class _KycUpdateState extends State<KycUpdate> {
  final TextEditingController adharno = TextEditingController();

  final TextEditingController panno = TextEditingController();

  @override
  void dispose() {
    adharno.dispose();
    panno.dispose();
    super.dispose();
  }

  File? _adarimage;
  File? _panimage;
  late String? adarurl;
  late String? panurl;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Future pickadarimage() async {
      final XFile? photo =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (photo == null) return;
      final tempimage = File(photo.path);
      setState(() {
        this._adarimage = tempimage;
      });
    }

    Future pickpanimage() async {
      final XFile? photo =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (photo == null) return;
      final tempimage = File(photo.path);
      setState(() {
        this._panimage = tempimage;
      });
    }

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

    Widget cardphotofeild(text, image) {
      return Center(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
                // height: height * 0.08,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: [
                      image == null
                          ? const Icon(
                              Icons.document_scanner,
                              size: 100,
                            )
                          : Image.file(
                              image!,
                              width: 200,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                      Text(
                        text,
                        style: h2(),
                      )
                    ],
                  ),
                )),
          ),
        ),
      );
    }

    Future upload() async {
      String adarphoto = _adarimage!.path;
      String panphoto = _panimage!.path;
      TaskSnapshot adartaskSnapshot = await FirebaseStorage.instance
          .ref()
          .child('uploads/$adarphoto')
          .putFile(_adarimage!);
      TaskSnapshot pantaskSnapshot = await FirebaseStorage.instance
          .ref()
          .child('uploads/$panphoto')
          .putFile(_panimage!);

      await adartaskSnapshot.ref.getDownloadURL().then((value) => setState(() {
            adarurl = value;
          }));

      await pantaskSnapshot.ref.getDownloadURL().then((value) => setState(() {
            panurl = value;
          }));
      UiHelper.showLoadingDialog(context, 'Loading');
      String? email = FirebaseAuth.instance.currentUser!.email;
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .collection('kycupdate')
            .doc('kycupdate')
            .set({
          'Aadhar Number': adharno.text,
          'Pan Number': panno.text,
          'Aadhar Photot': adarurl,
          'Pan Photo': panurl,
          'Verified': false,
        }).then((value) => Navigator.of(context).pop());
      } on FirebaseException catch (e) {
        Navigator.of(context).pop();
        UiHelper.showErrorDialog(
            context, e.message.toString(), 'An Error Occured');
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/wallpaper.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: width,
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
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
                      'KYC Update',
                      style: tittle(),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  cardtextfeild(adharno, 'Aadhar Card Number'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  cardtextfeild(panno, 'Pan Card Number'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  // cardtextfeild(adharpath, 'Account Number'),
                  GestureDetector(
                      onTap: (() {
                        pickadarimage();
                      }),
                      child: cardphotofeild('Aadhar Card Photo', _adarimage)),
                  const SizedBox(
                    height: 15.0,
                  ),
                  // cardtextfeild(panpath, 'IFSC code'),
                  GestureDetector(
                      onTap: (() {
                        pickpanimage();
                      }),
                      child: cardphotofeild('Pan Card Photo', _panimage)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomButton(
                        text: "Submit",
                        ontap: () {
                          upload();
                        }),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
