import 'package:dndmin/backend/dice.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/fonts/diceIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

Dados lastThrow =
    Dados(id: '0', nombre: 'Gonzalo', tipoDado: '1d20', tiradaDado: '30');

class LastDiceCard extends StatefulWidget {
  LastDiceCard({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _LastDiceCardState createState() => _LastDiceCardState(userData: userData);
}

class _LastDiceCardState extends State<LastDiceCard> {
  _LastDiceCardState({@required this.userData});
  final UserData userData;
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      if (this.mounted) setState(() {});
    });
    Future<Throws> _diceThrows =
        Future<Throws>(() => Throws.getThrows(userData.authToken));
    return Container(
      width: MediaQuery.of(context).size.width - 35,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, -0.5), //(x,y)
            spreadRadius: 0.6,
            blurRadius: 6,
          ),
        ],
      ),
      child: FutureBuilder(
        future: _diceThrows,
        builder: (BuildContext context, AsyncSnapshot<Throws> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) return Icon(Icons.error);
            lastThrow = snapshot.data.dados[snapshot.data.dados.length - 1];
            return CardData(lastThrow: lastThrow);
          } else {
            if (lastThrow.tipoDado == '1d20' && lastThrow.tiradaDado == '30') {
              return Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator()),
                  ),
                  Center(
                    child: Text(
                      'Cargando...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              );
            }
            return CardData(lastThrow: lastThrow);
          }
        },
      ),
    );
  }
}

class CardData extends StatelessWidget {
  CardData({@required this.lastThrow});
  final Dados lastThrow;
  @override
  Widget build(BuildContext context) {
    int diceMax = int.parse(lastThrow.tipoDado.replaceFirst('1d', ''));
    Color colorIndicator = Palette.fontColor;
    if (int.parse(lastThrow.tiradaDado) == 1) {
      colorIndicator = Palette.topGradient;
    } else if (int.parse(lastThrow.tiradaDado) == diceMax) {
      colorIndicator = Palette.bottomGradient;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              boxShadow: Palette.standartShadow,
              gradient: Palette.standardGradient,
              borderRadius: BorderRadius.circular(90),
            ),
            child: Icon(
              (diceMax == 20)
                  ? DiceIcons.dice_d20_bold
                  : (diceMax == 12)
                      ? DiceIcons.dice_d12_bold
                      : (diceMax == 10)
                          ? DiceIcons.dice_d10_bold
                          : (diceMax == 8)
                              ? DiceIcons.dice_d8_bold
                              : (diceMax == 6)
                                  ? DiceIcons.dice_d6_bold
                                  : DiceIcons.dice_d4_bold,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: lastThrow.nombre + " ha sacado un ",
                style: TextStyle(
                  color: Palette.fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: lastThrow.tiradaDado,
                    style: TextStyle(
                      color: colorIndicator,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                "En un dado de " + diceMax.toString(),
                style: TextStyle(color: Palette.fontColor),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        )
      ],
    );
  }
}
