import 'dart:async';
import 'package:dndmin/backend/classAbilities.dart';
import 'package:dndmin/backend/raceAbilities.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/charAbilities/firstPage.dart';
import 'package:dndmin/ui/charAbilities/secondPage.dart';
import 'package:dndmin/ui/charMenu/swipableCard.dart';
import 'package:dndmin/ui/charMenu/swipableCardSelector.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

RaceAbilities raceAbilities = RaceAbilities(mainAbilities: []);
ClassAbilities classAbilities = ClassAbilities(habilidadesDeClase: []);

class CharAbilities extends StatelessWidget {
  final UserData userData;
  CharAbilities({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharAbilities(
        title: 'Habilidades de tu Personaje',
        userData: userData,
      ),
    );
  }
}

class MyCharAbilities extends StatefulWidget {
  MyCharAbilities({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyCharAbilitiesState createState() =>
      _MyCharAbilitiesState(userData: userData);
}

class _MyCharAbilitiesState extends State<MyCharAbilities> {
  final UserData userData;
  _MyCharAbilitiesState({@required this.userData});

  int selected = 1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Future<RaceAbilities> _raceAbilities =
        RaceAbilities.getRaceAbilities(userData.id);
    Future<ClassAbilities> _classAbilities =
        ClassAbilities.getClassAbilities(userData.id);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onPanEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx < 1000.0)
                  setState(() {
                    if (selected == 0 || selected == 1)
                      selected++;
                    else if (selected == 2) selected = 2;
                  });
                if (details.velocity.pixelsPerSecond.dx > -1000.0)
                  setState(() {
                    if (selected == 2 || selected == 1)
                      selected--;
                    else if (selected == 0) selected = 0;
                  });
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 120,
                    left: 17.5,
                    right: 17.5,
                    bottom: MediaQuery.of(context).size.height - 180,
                    child: SwipableCardSelector(
                      labels: [
                        "Raza",
                        "Clase",
                        "Conjuros",
                      ],
                      current: [
                        (selected == 0),
                        (selected == 1),
                        (selected == 2),
                      ],
                      onPressed: [
                        () => setState(() => selected = 0),
                        () => setState(() => selected = 1),
                        () => setState(() => selected = 2),
                      ],
                    ),
                  ),
                  SwipableCard(
                      child: Container(
                        child: SingleChildScrollView(
                          child: FutureBuilder(
                            future: Future.wait([_classAbilities]),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<dynamic>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) return Icon(Icons.error);
                                classAbilities = snapshot.data[0];
                                return AbilitiesSecondPage(
                                  classAbilities: classAbilities,
                                );
                              } else {
                                if (classAbilities.habilidadesDeClase.length ==
                                    0) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height -
                                        300,
                                    child: Stack(
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: CircularProgressIndicator(),
                                          ),
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
                                return AbilitiesSecondPage(
                                  classAbilities: classAbilities,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      offView: (selected == 1)
                          ? 0
                          : (selected == 2)
                              ? -1
                              : 1),
                  SwipableCard(
                      child: Container(), offView: (selected == 2) ? 0 : 1),
                  SwipableCard(
                      child: Container(
                        child: SingleChildScrollView(
                          child: FutureBuilder(
                            future: Future.wait([_raceAbilities]),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<dynamic>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) return Icon(Icons.error);
                                raceAbilities = snapshot.data[0];
                                return AbilitiesFirstPage(
                                  raceAbilities: raceAbilities,
                                );
                              } else {
                                if (raceAbilities.mainAbilities.length == 0) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height -
                                        300,
                                    child: Stack(
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: CircularProgressIndicator(),
                                          ),
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
                                return AbilitiesFirstPage(
                                  raceAbilities: raceAbilities,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      offView: (selected == 0) ? 0 : -1),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height - 120,
              child: TopBar(
                userData: userData,
              ),
            ),
            AnimatedBottomBar(
              userData: userData,
              buttonState: [false, false, false, true, false],
            ),
          ],
        ),
      ),
    );
  }
}
