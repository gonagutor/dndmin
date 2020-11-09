import 'package:dndmin/config/palette.dart';
import 'package:dndmin/extensions/all.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AbilityCard extends StatelessWidget {
  const AbilityCard({
    @required this.ability,
    @required this.icon,
    @required this.usedStat,
    @required this.proficient,
  });
  final IconData icon;
  final String usedStat;
  final String ability;
  final bool proficient;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Palette.standardRadius),
        child: Stack(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 33.3 * 2 - 10),
              height: (MediaQuery.of(context).size.width - 33.3 * 2 - 150) / 3,
              decoration: BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.all(Palette.standardRadius),
              ),
            ),
            Row(
              children: [
                Container(
                  width:
                      (MediaQuery.of(context).size.width - 33.3 * 2 - 150) / 3,
                  height:
                      (MediaQuery.of(context).size.width - 33.3 * 2 - 150) / 3,
                  decoration: BoxDecoration(
                    color: Palette.secondaryColor,
                    borderRadius: BorderRadius.all(Palette.standardRadius),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.5),
                        offset: Offset(0, -0.5), //(x,y)
                        spreadRadius: 0.1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: GradientIconMask(
                          gradientTop: Palette.topGradient,
                          gradientBottom: Palette.bottomGradient,
                          child: Icon(
                            icon,
                            size: (MediaQuery.of(context).size.width -
                                        33.3 * 2 -
                                        150) /
                                    3 -
                                20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Align(
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
                              4,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  width: (MediaQuery.of(context).size.width - 33.3 * 2 - 75),
                  height:
                      (MediaQuery.of(context).size.width - 33.3 * 2 - 150) / 3,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            ability,
                            style: TextStyle(
                              color: Palette.fontColor,
                              fontSize: (MediaQuery.of(context).size.width -
                                          33.3 * 2 -
                                          150) /
                                      3 -
                                  40,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            int.parse(usedStat).modToString(),
                            style: TextStyle(
                              color: Palette.fontColor,
                              fontWeight: FontWeight.bold,
                              fontSize: (MediaQuery.of(context).size.width -
                                          33.3 * 2 -
                                          150) /
                                      3 -
                                  15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
