import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';

class PrevButton extends StatelessWidget {
  final Function prevPage;
  PrevButton({this.prevPage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 50,
          width: 108,
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
            onPressed: prevPage,
            //Navigator.of(context).push(_routeToCharSel),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Palette.fontColor,
                ),
                Text("Volver"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
