import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushbar(BuildContext context, String message) => Flushbar(
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: 20,
      barBlur: 20,
      backgroundColor: Colors.white.withOpacity(0.7),
      margin: EdgeInsets.all(10),
      icon: Icon(
        Icons.done,
        color: Colors.green,
      ),
      message: message,
    )..show(context);

void showErrorFlushbar(BuildContext context, String message) => Flushbar(
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: 20,
      barBlur: 20,
      backgroundColor: Colors.grey.withOpacity(0.7),
      margin: EdgeInsets.all(10),
      icon: Icon(
        Icons.error,
        color: Colors.red,
      ),
      message: message,
    )..show(context);
