import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';

class ThrowDiceButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final int size;
  ThrowDiceButton({
    @required this.onPressed,
    @required this.icon,
    this.size = 80,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        height: (MediaQuery.of(context).size.width - size) / 3,
        width: (MediaQuery.of(context).size.width - size) / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 4), //(x,y)
              spreadRadius: 0,
              blurRadius: 5,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[
              Palette.topGradient,
              Palette.bottomGradient,
            ],
          ),
        ),
        child: Stack(
          children: [
            FlatButton(
              onPressed: onPressed,
              color: Color(0x0091AAF3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
              child: Container(
                width: (MediaQuery.of(context).size.width - size) / 3,
                height: (MediaQuery.of(context).size.width - size) / 3,
              ),
            ),
            IgnorePointer(
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
