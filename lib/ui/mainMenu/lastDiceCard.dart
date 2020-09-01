import 'package:dndmin/backend/dice.dart';
import 'package:dndmin/backend/userData.dart';
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
      constraints: BoxConstraints(minHeight: 210),
      width: MediaQuery.of(context).size.width - 35,
      height: 210,
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
    Color colorIndicator = Color(0xFF707070);
    if (int.parse(lastThrow.tiradaDado) == 1) {
      colorIndicator = Color(0xFF86B1F4);
    } else if (int.parse(lastThrow.tiradaDado) ==
        int.parse(lastThrow.tipoDado.replaceFirst('1d', ''))) {
      colorIndicator = Color(0xFF79B9F6);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF86B1F4),
                  Color(0xFF79B9F6),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                lastThrow.tipoDado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 5),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: lastThrow.nombre + ' ha sacado un ',
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: lastThrow.tiradaDado,
                    style: TextStyle(color: colorIndicator),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ButtonTheme(
            height: 65,
            minWidth: 300,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[
                    const Color(0xFFFF64E0),
                    const Color(0xFF46DAFF),
                  ],
                ),
              ),
              child: FlatButton(
                onPressed: () {}, //Goto Last Throws
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
                child: RichText(
                  text: TextSpan(
                    text: 'Ver Las Ultimas Tiradas',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
