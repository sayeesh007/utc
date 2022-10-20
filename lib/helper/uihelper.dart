// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/helper/fuctions.dart';

class UiHelper {
  static void showLoadingDialog(BuildContext context, String text) {
    AlertDialog loadingDialog = AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 10.0,
            ),
            Text(text, style: h2())
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return loadingDialog;
        });
  }

  static void showErrorDialog(BuildContext context, String text, String title) {
    AlertDialog errorDialog = AlertDialog(
      title: Text(
        title,
        style: h1(),
      ),
      content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: h2(),
          )),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'ok',
              style: h2(),
            ))
      ],
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return errorDialog;
        });
  }
}
