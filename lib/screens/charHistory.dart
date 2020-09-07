import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharHistory extends StatelessWidget {
  final UserData userData;
  CharHistory({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharHistory(
        title: 'Descripción de tu personaje',
        userData: userData,
      ),
    );
  }
}

class MyCharHistory extends StatefulWidget {
  MyCharHistory({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyCharHistoryState createState() => _MyCharHistoryState(userData: userData);
}

class _MyCharHistoryState extends State<MyCharHistory> {
  final UserData userData;
  _MyCharHistoryState({@required this.userData});

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
            colors: [Palette.topGradient, Palette.bottomGradient],
            stops: [0.0, 1.0],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height - 120,
              child: TopBar(
                userData: userData,
              ),
            ),
            Positioned(
              top: 180,
              bottom: 90,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Card(),
                  ),
                ],
              ),
            ),
            AnimatedBottomBar(
              userData: userData,
              buttonState: [false, false, false, false, true],
            ),
          ],
        ),
      ),
    );
  }
}
