import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const defaultRadius = 10.0;
const defaultPadding = 15.0;
const defaultPageDuration = Duration(milliseconds: 500);

var primaryColorString = const Color(0xffCB4044);
var secondaryColorString = const Color(0xffBFBFBF);

showToast(String? message) => Fluttertoast.showToast(
    msg: message.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 10,
    textColor: Colors.white,
    fontSize: 16.0);
