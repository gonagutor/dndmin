import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';

class RoundedSquareCard extends StatelessWidget {
  RoundedSquareCard({this.topText, this.centerText});
  final String topText;
  final String centerText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 100) / 3,
      height: (MediaQuery.of(context).size.width - 100) / 3,
      decoration: BoxDecoration(
        color: Palette.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  centerText,
                  style: TextStyle(
                    color: Palette.fontColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  topText,
                  style: TextStyle(
                    color: Palette.fontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
