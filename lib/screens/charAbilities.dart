import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              top: 120,
              bottom: 90,
              right: 17.5,
              left: 17.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 17.5 * 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        boxShadow: Palette.standartShadow,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
