import 'package:dndmin/backend/login.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/mainMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:dndmin/backend/characters.dart';
import 'package:flutter/material.dart';

class CharacterListCard extends StatelessWidget {
  final UserData userData;
  final Personaje personaje;
  CharacterListCard({@required this.personaje, @required this.userData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, -0.5), //(x,y)
              spreadRadius: 0.6,
              blurRadius: 6,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        height: 100,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              right: MediaQuery.of(context).size.width / 4.3,
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: TextStyle(fontSize: 20, color: Color(0xFF707070)),
                  children: [
                    TextSpan(
                      text: personaje.nombre,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ", " + personaje.subNombre,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: Text(
                personaje.raza + ", " + personaje.clase,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Positioned(
              top: 65,
              left: 10,
              child: Text(
                "Nivel " +
                    personaje.nivel +
                    " (" +
                    personaje.pxActuales +
                    "/" +
                    personaje.pxTotales +
                    ")",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Positioned(
              top: 65,
              left: MediaQuery.of(context).size.width / 2,
              child: Text(
                "ID: " + personaje.id.toString(),
                style: TextStyle(fontSize: 15),
              ),
            ),
            Positioned(
              right: 0,
              left: MediaQuery.of(context).size.width / 1.6,
              top: 0,
              bottom: 0,
              child: MediaQuery.removePadding(
                context: context,
                removeRight: true,
                child: ButtonTheme(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
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
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Login.writeChar(personaje.nombre, personaje.id);
                        runApp(MainMenu(
                          userData: UserData(
                            uName: userData.uName,
                            authToken: userData.authToken,
                            selectedCharName: personaje.nombre,
                            id: int.parse(personaje.id),
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
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
