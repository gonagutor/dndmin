import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwipeUpMenu extends StatelessWidget {
  final UserData userData;
  SwipeUpMenu({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MySwipeUpMenu(
        title: 'Menú deslizable',
        userData: userData,
      ),
    );
  }
}

class MySwipeUpMenu extends StatefulWidget {
  MySwipeUpMenu({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MySwipeUpMenuState createState() => _MySwipeUpMenuState(userData: userData);
}

class _MySwipeUpMenuState extends State<MySwipeUpMenu> {
  final UserData userData;
  _MySwipeUpMenuState({@required this.userData});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, -0.5), //(x,y)
              spreadRadius: 0.6,
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 90),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Palette.fontColor,
                      ),
                      text: "Tirar Dados",
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
