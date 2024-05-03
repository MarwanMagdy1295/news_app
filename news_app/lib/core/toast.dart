import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../core/color.dart';

void customToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: kbackGroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void customToastWaiting(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: kbackGroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
