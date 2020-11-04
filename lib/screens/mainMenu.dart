import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/throwListScreen.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainMenu extends StatelessWidget {
  final UserData userData;
  MainMenu({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMainMenu(
        title: 'Menú Principal',
        userData: userData,
      ),
    );
  }
}

class MyMainMenu extends StatefulWidget {
  MyMainMenu({Key key, this.title, @required this.userData}) : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyMainMenuState createState() => _MyMainMenuState(userData: userData);
}

class _MyMainMenuState extends State<MyMainMenu> {
  final UserData userData;
  _MyMainMenuState({@required this.userData});

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
              top: 120,
              left: 17.5,
              right: 17.5,
              bottom: MediaQuery.of(context).size.height - 180,
              child: CharacterIndicator(userData: userData),
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
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: GestureDetector(
                      onTap: () => runApp(ThrowListScreen(userData: userData)),
                      child: LastDiceCard(
                        userData: userData,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 305,
              bottom: 90,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: EventList(
                      userData: userData,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedBottomBar(
              userData: userData,
              buttonState: [false, false, true, false, false],
            ),
          ],
        ),
      ),
    );
  }
}
