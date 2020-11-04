import 'dart:async';
import 'package:dndmin/backend/inventory.dart';
import 'package:dndmin/backend/skills.dart';
import 'package:dndmin/backend/stats.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/charMenu/all.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PlayerStats playerStats = PlayerStats(id: '0');
Inventario playerInventory = Inventario(id: '0');
PlayerSkills playerSkills = PlayerSkills(id: '0');

class CharMenu extends StatelessWidget {
  final UserData userData;
  CharMenu({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharMenu(
        title: 'Información de tu personaje',
        userData: userData,
      ),
    );
  }
}

class MyCharMenu extends StatefulWidget {
  MyCharMenu({Key key, this.title, @required this.userData}) : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyCharMenuState createState() => _MyCharMenuState(userData: userData);
}

class _MyCharMenuState extends State<MyCharMenu> {
  final UserData userData;
  _MyCharMenuState({@required this.userData});
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Timer(Duration(seconds: 2), () {
      if (this.mounted) setState(() {});
    });
    Future<Stats> pStats = Stats.getStats(userData.authToken, userData.id);
    Future<Inventory> pInventory =
        Inventory.getInventory(userData.authToken, userData.id);
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
                      current: [
                        (selected == 0),
                        (selected == 1),
                        (selected == 2)
                      ],
                      onPressed: [
                        () => setState(() => selected = 0),
                        () => setState(() => selected = 1),
                        () => setState(() => selected = 2),
                      ],
                    ),
                  ),
                  SwipableCard(
                      child: SingleChildScrollView(
                        child: FutureBuilder(
                          future: Future.wait([pInventory, pStats]),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<dynamic>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) return Icon(Icons.error);
                              playerStats = snapshot.data[1].stats[0];
                              playerInventory = snapshot.data[0].inventario[0];
                              return SecondPage(
                                playerStats: playerStats,
                                playerInventory: playerInventory,
                              );
                            } else {
                              if (playerStats.id == '0' &&
                                  playerInventory.id == '0') {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height - 300,
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
                              return SecondPage(
                                playerStats: playerStats,
                                playerInventory: playerInventory,
                              );
                            }
                          },
                        ),
                      ),
                      offView: (selected == 1)
                          ? 0
                          : (selected == 2)
                              ? -1
                              : 1),
                  SwipableCard(
                      child: Center(
                        child: SingleChildScrollView(
                          child: FutureBuilder(
                            future: Skills.getSkills(
                                userData.authToken, userData.id),
                            builder: (BuildContext context,
                                AsyncSnapshot<Skills> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) return Icon(Icons.error);
                                playerSkills = snapshot.data.skills[0];
                                return ThirdPage(
                                  playerSkills: playerSkills,
                                );
                              } else {
                                if (playerSkills.id == '0') {
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
                                return ThirdPage(
                                  playerSkills: playerSkills,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      offView: (selected == 2) ? 0 : 1),
                  SwipableCard(
                      child: Center(
                        child: SingleChildScrollView(
                          child: FutureBuilder(
                            future: Future.wait([pInventory, pStats]),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<dynamic>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) return Icon(Icons.error);
                                playerStats = snapshot.data[1].stats[0];
                                playerInventory =
                                    snapshot.data[0].inventario[0];
                                return FirstPage(
                                  playerStats: playerStats,
                                  playerInventory: playerInventory,
                                );
                              } else {
                                if (playerStats.id == '0' &&
                                    playerInventory.id == '0') {
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
                                return FirstPage(
                                  playerStats: playerStats,
                                  playerInventory: playerInventory,
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
              buttonState: [false, true, false, false, false],
            ),
          ],
        ),
      ),
    );
  }
}
