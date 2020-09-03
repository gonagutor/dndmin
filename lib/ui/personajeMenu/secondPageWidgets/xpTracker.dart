import 'package:dndmin/backend/stats.dart';
import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';

class XPTracker extends StatelessWidget {
  const XPTracker({@required this.playerStats});

  final PlayerStats playerStats;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 33.3 * 2 - 10),
      height: (MediaQuery.of(context).size.width - 100) / 3 / 1.5,
      decoration: BoxDecoration(
        color: Palette.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text(
                  playerStats.pxActuales + ' / ' + playerStats.px,
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
                  'Puntos de Experiencia',
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
