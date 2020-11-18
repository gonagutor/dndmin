import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedSquareCard extends StatelessWidget {
  RoundedSquareCard({this.topText, this.centerText, this.proficient});
  final String topText;
  final String centerText;
  final bool proficient;
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
                    fontSize: MediaQuery.of(context).size.width / 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            (proficient != null)
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      FontAwesomeIcons.dotCircle,
                      color: (proficient)
                          ? Colors.greenAccent
                          : Colors.transparent,
                      size: ((MediaQuery.of(context).size.width -
                                      33.3 * 2 -
                                      150) /
                                  3 -
                              20) /
                          3,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
