import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function nextPage;
  NextButton({this.nextPage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 50,
          width: 128,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(180)),
            border: Border.all(
              color: Palette.topGradient,
              width: 2,
            ),
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(180),
              ),
            ),
            onPressed: nextPage,
            //Navigator.of(context).push(_routeToCharSel),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Continuar"),
                RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Palette.fontColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
