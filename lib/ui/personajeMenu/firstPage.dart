import 'package:dndmin/backend/inventory.dart';
import 'package:dndmin/backend/stats.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/extensions/all.dart';
import 'package:dndmin/fonts/rpgAwesomeIcons.dart';
import 'package:dndmin/ui/personajeMenu/secondPageWidgets/all.dart';
import 'package:dndmin/ui/personajeMenu/firstPage/characteristicDisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dndmin/extensions/getModifier.dart';

class FirstPage extends StatelessWidget {
  FirstPage({
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
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Atributos',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CaracteristicDisplay(
              icon: RPGAwesome.hand,
              characteristic: 'Fuerza',
              value: playerStats.fuerza,
            ),
            CaracteristicDisplay(
              icon: RPGAwesome.feathered_wing,
              characteristic: 'Destreza',
              value: playerStats.destreza,
            ),
            CaracteristicDisplay(
              icon: RPGAwesome.broken_shield,
              characteristic: 'Constitución',
              value: playerStats.constitucion,
            ),
            CaracteristicDisplay(
              icon: RPGAwesome.book,
              characteristic: 'Inteligencia',
              value: playerStats.inteligencia,
            ),
            CaracteristicDisplay(
              icon: RPGAwesome.thorny_vine,
              characteristic: 'Sabiduría',
              value: playerStats.sabiduria,
            ),
            CaracteristicDisplay(
              icon: RPGAwesome.speech_bubble,
              characteristic: 'Carisma',
              value: playerStats.carisma,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                'Modif. de Salvación',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedSquareCard(
                    topText: 'Fuerza',
                    centerText: playerStats.fuerza.getModifier().modToString(),
                  ),
                  RoundedSquareCard(
                    topText: 'Destreza',
                    centerText:
                        playerStats.destreza.getModifier().modToString(),
                  ),
                  RoundedSquareCard(
                    topText: 'Constitución',
                    centerText:
                        playerStats.constitucion.getModifier().modToString(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedSquareCard(
                    topText: 'Inteligencia',
                    centerText:
                        playerStats.inteligencia.getModifier().modToString(),
                  ),
                  RoundedSquareCard(
                    topText: 'Sabiduría',
                    centerText:
                        playerStats.sabiduria.getModifier().modToString(),
                  ),
                  RoundedSquareCard(
                    topText: 'Carisma',
                    centerText: playerStats.carisma.getModifier().modToString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
