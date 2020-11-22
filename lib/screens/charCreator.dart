import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesOne.dart';
import 'package:dndmin/screens/charSelector.dart';
import 'package:dndmin/ui/charCreatorPages/prevButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharCreator extends StatelessWidget {
  final UserData userData;
  CharCreator({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharCreator(
        userData: userData,
      ),
    );
  }
}

class MyCharCreator extends StatefulWidget {
  final UserData userData;
  MyCharCreator({@required this.userData});
  @override
  _MyCharCreatorState createState() => _MyCharCreatorState(userData: userData);
}

class _MyCharCreatorState extends State<MyCharCreator> {
  final UserData userData;
  _MyCharCreatorState({@required this.userData});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Palette.topGradient, Palette.bottomGradient],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: Palette.standartShadow,
                borderRadius: BorderRadius.all(Palette.standardRadius),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 90),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              child: Image(
                                image: AssetImage('images/appIcon.png'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20, bottom: 10),
                              child: Text(
                                "Bienvenido a la creación de personajes",
                                style: TextStyle(
                                    color: Palette.fontColor, fontSize: 40),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "¿Listo para crear tu personaje? \n\nPrepara tu hoja de personaje y rellena el siguiente formulario para crear el personaje",
                              style: TextStyle(
                                  color: Palette.fontColor, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, bottom: 20, left: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: Palette.standartShadow,
                                gradient: Palette.standardGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                              ),
                              width: double.infinity,
                              height: 70,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90))),
                                onPressed: () => runApp(
                                    CharCreatorPagesOne(userData: userData)),
                                //Navigator.of(context).push(_routeToNextPage),
                                child: Text(
                                  "Comenzar",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PrevButton(
                    prevPage: () => runApp(CharSelector(userData: userData)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
