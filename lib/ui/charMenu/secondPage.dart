import 'package:dndmin/backend/inventory.dart';
import 'package:dndmin/backend/stats.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/extensions/all.dart';
import 'package:dndmin/ui/charMenu/secondPageWidgets/all.dart';
import 'package:dndmin/ui/charMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondPage extends StatelessWidget {
  SecondPage({
    @required this.playerStats,
    @required this.playerInventory,
    this.onMinus,
    this.onPlus,
  });
  final PlayerStats playerStats;
  final Inventario playerInventory;
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
                              text: playerStats.pvActuales,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                shadows: Palette.standartShadow,
                              ),
                            ),
                            TextSpan(
                              text: '/' + playerStats.pv,
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
                CoinIndicator(playerInventory: playerInventory),
                XPTracker(playerStats: playerStats),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Inventario',
                    style: TextStyle(
                      color: Palette.fontColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InventorySlots(playerInventory: playerInventory),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Proficiencias',
                    style: TextStyle(
                      color: Palette.fontColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 33.3 * 2 - 10),
                  child: Text(
                    (playerInventory.proficiencias == '')
                        ? 'No has establecido tus proficiencias todavía'
                        : playerInventory.proficiencias,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Palette.fontColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 33.3 * 2 - 10),
                    child: Text(
                      'Tu bonificador de proficiencia es: \n' +
                          playerStats.profBonus.modToString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Palette.fontColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
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
