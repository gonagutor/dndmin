import 'package:dndmin/config/palette.dart';
import 'package:dndmin/extensions/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dndmin/extensions/getModifier.dart';

class CaracteristicDisplay extends StatelessWidget {
  CaracteristicDisplay({
    @required this.icon,
    @required this.characteristic,
    @required this.value,
  });
  final IconData icon;
  final String characteristic;
  final String value;
  @override
  Widget build(BuildContext context) {
    String modifier = value.getModifier().modToString();
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Stack(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 33.3 * 2),
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Palette.topGradient,
                  Palette.bottomGradient,
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ),
              color: Palette.secondaryColor,
              borderRadius: BorderRadius.all(Palette.standardRadius),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -45,
                  left: 0,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(20 / 360),
                    child: Icon(
                      icon,
                      size: 150,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      characteristic,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Color(0xFF000000),
                            offset: Offset(0, -0.5), //(x,y)
                            spreadRadius: 0.4,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: (MediaQuery.of(context).size.width - 33.3 * 2 - 100) / 3,
              height: 60,
              decoration: BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Palette.standardRadius,
                  bottomRight: Palette.standardRadius,
                ),
              ),
              child: Center(
                child: Text(
                  modifier,
                  style: TextStyle(
                    fontSize: 40,
                    color: Palette.fontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
