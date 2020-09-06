import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/loginScreen.dart';
import 'package:dndmin/screens/mainMenu.dart';
import 'package:dndmin/ui/charSelector/charFutureBuilder.dart';
import 'package:dndmin/backend/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharSelector extends StatelessWidget {
  final UserData userData;
  CharSelector({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharSelector(
        title: 'Selección de personaje',
        userData: userData,
      ),
    );
  }
}

class MyCharSelector extends StatefulWidget {
  MyCharSelector({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyCharSelectorState createState() =>
      _MyCharSelectorState(userData: userData);
}

class _MyCharSelectorState extends State<MyCharSelector> {
  final UserData userData;
  _MyCharSelectorState({@required this.userData});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFF64E0),
              const Color(0xFF46DAFF),
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipPath(
                    child: Container(
                      width: 350,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'Elige tu personaje',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF707070)),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height / 6,
                                maxHeight:
                                    MediaQuery.of(context).size.height / 6 * 4 -
                                        15),
                            child: CharFutureBuilder(
                              userData: userData,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: RaisedButton(
                              color: Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)),
                                side: BorderSide(color: Colors.purpleAccent),
                              ),
                              elevation: 5,
                              onPressed: () async {
                                String selChar = await Login.readChar();
                                if (selChar == null) {
                                  Navigator.of(context).pop();
                                  Login.deleteName();
                                  Login.deleteChar();
                                  Login.deleteToken();
                                  Login.deleteCharId();
                                  runApp(LoginScreen());
                                } else {
                                  runApp(MainMenu(
                                    userData: userData,
                                  ));
                                }
                              },
                              child: Text(
                                'Volver',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
