import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_test/constants/color.dart';

class ToastUtils {
  static showRedToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        // timeInSecForIos: 4,
        backgroundColor: kBlack,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
