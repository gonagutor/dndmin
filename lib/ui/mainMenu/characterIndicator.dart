import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/charSelector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterIndicator extends StatelessWidget {
  final UserData userData;
  CharacterIndicator({this.userData});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: 'Has seleccionado a:\n',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF707070),
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: userData.selectedCharName,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF707070),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
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
                    title: Text('Cambiar Personaje'),
                    content: Text('¿Seguro que quieres cambiar de personaje?'),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          runApp(CharSelector(
                            userData: userData,
                          ));
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
                'Cambiar',
                style: TextStyle(
                  color: Color(0xFF505050),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
