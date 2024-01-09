import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resourses/color.dart';
import 'global.dart';

enum Result { success, warning, error }

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static flushBarErrorMessage(String message, {int duration = 3}) {
    showFlushbar(
      context: navigatorKey.currentContext!,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: Duration(seconds: duration),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(navigatorKey.currentContext!),
    );
  }

  static snackBar(String message,
      {Result result = Result.success, int duration = 3}) {
    Color getColor(result) {
      if (result == Result.warning) {
        return AppColor.warning;
      }
      if (result == Result.error) {
        return AppColor.error;
      }
      return AppColor.success;
    }

    return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: getColor(result),
        content: Center(child: Text(message)),
        duration: Duration(seconds: duration),
      ),
    );
  }

  static void filedFocusChange(FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(navigatorKey.currentContext!).requestFocus(next);
  }
}
