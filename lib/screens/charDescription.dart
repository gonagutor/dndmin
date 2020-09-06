import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharDescription extends StatelessWidget {
  final UserData userData;
  CharDescription({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharDescription(
        title: 'Descripción de tu personaje',
        userData: userData,
      ),
    );
  }
}

class MyCharDescription extends StatefulWidget {
  MyCharDescription({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyCharDescriptionState createState() =>
      _MyCharDescriptionState(userData: userData);
}

class _MyCharDescriptionState extends State<MyCharDescription> {
  final UserData userData;
  _MyCharDescriptionState({@required this.userData});

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
              const Color(0xFFFF64E0),
              const Color(0xFF46DAFF),
            ],
            stops: [
              0.0,
              1.0,
            ],
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
              buttonState: [true, false, false, false, false],
            ),
          ],
        ),
      ),
    );
  }
}
