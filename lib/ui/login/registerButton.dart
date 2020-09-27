import 'dart:ui';
import 'package:dndmin/screens/registerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: ButtonTheme(
        height: 65,
        minWidth: 300,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: <Color>[
                Color(0xFF86B1F4),
                Color(0xFF79B9F6),
              ],
            ),
          ),
          child: FlatButton(
            onPressed: () {
              runApp(RegisterScreen());
            },
            color: const Color(0x0091AAF3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
            child: RichText(
              text: TextSpan(
                text: 'Registrarse',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
