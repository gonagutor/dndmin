import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondPage extends StatelessWidget {
  SecondPage({
    @required this.currentLife,
    @required this.maxLife,
    this.onMinus,
    this.onPlus,
  });
  final int maxLife;
  final int currentLife;
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
                      maxLife: 10,
                      currentLife: 8,
                      playerIndicator: Text(
                        'hola',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                            child: Center(
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        color: Palette.fontColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Iniciativa',
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
                          )
                        ],
                      ),
                      Column(
                        children: [
                          RoundedSquareCard(
                            child: Center(
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      '25',
                                      style: TextStyle(
                                        color: Palette.fontColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Velocidad',
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
                          )
                        ],
                      ),
                      Column(
                        children: [
                          RoundedSquareCard(
                            child: Center(
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      '17',
                                      style: TextStyle(
                                        color: Palette.fontColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'CA',
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
                          )
                        ],
                      ),
                    ],
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

class LifeIndicator extends StatelessWidget {
  LifeIndicator(
      {@required this.currentLife,
      @required this.maxLife,
      @required this.playerIndicator});
  final Widget playerIndicator;
  final int maxLife;
  final int currentLife;
  @override
  Widget build(BuildContext context) {
    Color colorIndicator = Colors.greenAccent;
    if (maxLife / 3 >= currentLife)
      colorIndicator = Colors.redAccent;
    else if (maxLife / 2 >= currentLife) colorIndicator = Colors.orangeAccent;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: (MediaQuery.of(context).size.width / 3),
          height: (MediaQuery.of(context).size.width / 3),
          decoration: BoxDecoration(
            color: Palette.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(90)),
            boxShadow: Palette.standartShadow,
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width:
              (MediaQuery.of(context).size.width / 3) * (currentLife / maxLife),
          height:
              (MediaQuery.of(context).size.width / 3) * (currentLife / maxLife),
          decoration: BoxDecoration(
            color: colorIndicator,
            borderRadius: BorderRadius.all(Radius.circular(90)),
          ),
        ),
        playerIndicator,
      ],
    );
  }
}

class RoundedSquareCard extends StatelessWidget {
  RoundedSquareCard({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 100) / 3,
      height: (MediaQuery.of(context).size.width - 100) / 3,
      decoration: BoxDecoration(
        color: Palette.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: child,
    );
  }
}
