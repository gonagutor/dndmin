import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/personajeMenu/all.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonajeMenu extends StatelessWidget {
  final UserData userData;
  PersonajeMenu({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPersonajeMenu(
        title: 'Menú Principal',
        userData: userData,
      ),
    );
  }
}

class MyPersonajeMenu extends StatefulWidget {
  MyPersonajeMenu({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyPersonajeMenuState createState() =>
      _MyPersonajeMenuState(userData: userData);
}

class _MyPersonajeMenuState extends State<MyPersonajeMenu> {
  final UserData userData;
  _MyPersonajeMenuState({@required this.userData});
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Palette.topGradient,
              Palette.bottomGradient,
            ],
            stops: [
              0.0,
              1.0,
            ],
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
                    child: SwipableCardSelector(current: [
                      (selected == 0),
                      (selected == 1),
                      (selected == 2)
                    ], onPressed: [
                      () {
                        setState(() {
                          selected = 0;
                        });
                      },
                      () {
                        setState(() {
                          selected = 1;
                        });
                      },
                      () {
                        setState(() {
                          selected = 2;
                        });
                      },
                    ]),
                  ),
                  SwipableCard(
                      child: Center(
                        child: Text('Panel Central'),
                      ),
                      offView: (selected == 1) ? 0 : (selected == 2) ? -1 : 1),
                  SwipableCard(
                      child: Center(
                        child: Text('Panel Derecha'),
                      ),
                      offView: (selected == 2) ? 0 : 1),
                  SwipableCard(
                      child: Center(
                        child: Text('Panel Izquierda'),
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
