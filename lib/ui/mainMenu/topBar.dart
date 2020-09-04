import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:dndmin/backend/login.dart';
import 'package:dndmin/extensions/capitalise.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  TopBar({@required this.userData});
  final UserData userData;
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, 0.5), //(x,y)
            spreadRadius: 0.6,
            blurRadius: 6,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 3 * 1.8),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: '¡Hola, ' +
                            userData.uName.toString().capitalize() +
                            '!\n',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xFF707070),
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Estas son los últimos eventos',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF707070),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20, top: 5, bottom: 5),
                  child: RaisedButton(
                    color: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                      side: BorderSide(color: Colors.purpleAccent),
                    ),
                    elevation: 5,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Cerrar Sesión '),
                          content:
                              Text('¿Seguro que quieres cerrar la sesión?'),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Login.deleteChar();
                                Login.deleteName();
                                Login.deleteToken();
                                Login.deleteCharId();
                                runApp(LoginScreen());
                              },
                              child: Text("Si"),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("No"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Cerrar Sesion',
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
