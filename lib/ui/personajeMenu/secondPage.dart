import 'package:dndmin/backend/inventory.dart';
import 'package:dndmin/backend/stats.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/personajeMenu/SecondPageWidgets/all.dart';
import 'package:dndmin/ui/personajeMenu/all.dart';
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
                SlotsRow(
                  slotOne: 1,
                  slotTwo: 2,
                  slotTextOne: playerInventory.slot1,
                  slotTextTwo: playerInventory.slot2,
                ),
                SlotsRow(
                  slotOne: 3,
                  slotTwo: 4,
                  slotTextOne: playerInventory.slot3,
                  slotTextTwo: playerInventory.slot4,
                ),
                SlotsRow(
                  slotOne: 5,
                  slotTwo: 6,
                  slotTextOne: playerInventory.slot5,
                  slotTextTwo: playerInventory.slot6,
                ),
                SlotsRow(
                  slotOne: 7,
                  slotTwo: 8,
                  slotTextOne: playerInventory.slot7,
                  slotTextTwo: playerInventory.slot8,
                ),
                SlotsRow(
                  slotOne: 9,
                  slotTwo: 10,
                  slotTextOne: playerInventory.slot9,
                  slotTextTwo: playerInventory.slot10,
                ),
                SlotsRow(
                  slotOne: 11,
                  slotTwo: 12,
                  slotTextOne: playerInventory.slot11,
                  slotTextTwo: playerInventory.slot12,
                ),
                SlotsRow(
                  slotOne: 13,
                  slotTwo: 14,
                  slotTextOne: playerInventory.slot13,
                  slotTextTwo: playerInventory.slot14,
                ),
                SlotsRow(
                  slotOne: 16,
                  slotTwo: 16,
                  slotTextOne: playerInventory.slot15,
                  slotTextTwo: playerInventory.slot16,
                ),
                SlotsRow(
                  slotOne: 17,
                  slotTwo: 18,
                  slotTextOne: playerInventory.slot17,
                  slotTextTwo: playerInventory.slot18,
                ),
                SlotsRow(
                  slotOne: 19,
                  slotTwo: 20,
                  slotTextOne: playerInventory.slot19,
                  slotTextTwo: playerInventory.slot20,
                ),
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

class SlotsRow extends StatelessWidget {
  SlotsRow(
      {@required this.slotOne,
      @required this.slotTwo,
      this.slotTextOne,
      this.slotTextTwo});
  final int slotOne;
  final int slotTwo;
  final String slotTextOne;
  final String slotTextTwo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                child: Text(
                  'Slot ' + slotOne.toString() + ': ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Palette.fontColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  height: 50,
                  width: (MediaQuery.of(context).size.width - 75) / 2 - 10,
                  decoration: BoxDecoration(
                    color: Palette.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: Text(slotTextOne),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                child: Text(
                  'Slot ' + slotTwo.toString() + ': ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Palette.fontColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  height: 50,
                  width: (MediaQuery.of(context).size.width - 75) / 2 - 10,
                  decoration: BoxDecoration(
                    color: Palette.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: Text(slotTextTwo),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
