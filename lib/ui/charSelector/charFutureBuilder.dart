import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/charSelector/charListCard.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:dndmin/backend/characters.dart';
import 'package:flutter/material.dart';

class CharFutureBuilder extends StatelessWidget {
  final UserData userData;
  CharFutureBuilder({@required this.userData});
  @override
  Widget build(BuildContext context) {
    Future<CharactersList> _charFuture =
        CharactersList.getUserCharList(userData.authToken);
    return FutureBuilder(
      future: _charFuture,
      builder: (BuildContext context, AsyncSnapshot<CharactersList> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Icon(Icons.error);
          CharactersList charactersList = snapshot.data;
          if (charactersList != null) {
            if (charactersList.personajes[0].nombre !=
                    "NoCharactersRegistered." &&
                charactersList.personajes[0].id != null) {
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: charactersList.personajes.length,
                  itemBuilder: (context, index) {
                    return CharacterListCard(
                      personaje: charactersList.personajes[index],
                      userData: userData,
                    );
                  },
                ),
              );
            } else {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: 0, maxHeight: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Palette.fontColor,
                          ),
                          text:
                              "No tienes personajes todavía.\n Pulsa \"+\" arriba para crear uno nuevo",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Error de conexión.",
                    textAlign: TextAlign.center,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Reintentar'),
                  ),
                ],
              ),
            );
          }
        } else {
          return Container(
            height: 100,
            child: Stack(
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
            ),
          );
        }
      },
    );
  }
}
