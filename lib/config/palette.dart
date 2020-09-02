import 'package:flutter/cupertino.dart';

class Palette {
  static Color topGradient = const Color(0xFFFF64E0);
  static Color bottomGradient = const Color(0xFF46DAFF);
  static Color fontColor = const Color(0xFF707070);
  static Color secondaryColor = const Color(0xFFEFEFEF);
  static List<BoxShadow> standartShadow = [
    BoxShadow(
      color: Color(0xFF000000).withOpacity(0.5),
      offset: Offset(0, -0.5), //(x,y)
      spreadRadius: 0.6,
      blurRadius: 6,
    ),
  ];
}
