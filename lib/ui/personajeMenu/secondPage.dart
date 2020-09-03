import 'package:dndmin/backend/stats.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/personajeMenu/SecondPageWidgets/all.dart';
import 'package:dndmin/ui/personajeMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondPage extends StatelessWidget {
  SecondPage({
    @required this.playerStats,
    this.onMinus,
    this.onPlus,
  });
  final PlayerStats playerStats;
  final Function onPlus;
  final Function onMinus;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    playerStats.nombre + ', ' + playerStats.subNombre,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Palette.fontColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: onMinus,
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: Palette.fontColor,
                        size: 30,
                      ),
                    ),
                    LifeIndicator(
                      maxLife: int.parse(playerStats.pv),
                      currentLife: int.parse(playerStats.pvActuales),
                      playerIndicator: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: Palette.standartShadow,
                          ),
                          text: playerStats.nombre + '\n',
                          children: [
                            TextSpan(
                              text: playerStats.pv,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                shadows: Palette.standartShadow,
                              ),
                            ),
                            TextSpan(
                              text: '/' + playerStats.pvActuales,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                shadows: Palette.standartShadow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: onPlus,
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: Palette.fontColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          RoundedSquareCard(
                            topText: 'Iniciativa',
                            centerText: (int.parse(playerStats.iniciativa) > 0)
                                ? '+' + playerStats.iniciativa
                                : playerStats.iniciativa,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          RoundedSquareCard(
                            topText: 'Velocidad',
                            centerText: playerStats.velocidad,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          RoundedSquareCard(
                            topText: 'CA',
                            centerText: playerStats.ca,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CoinIndicator(playerStats: playerStats),
                XPTracker(playerStats: playerStats),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: EditButton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
