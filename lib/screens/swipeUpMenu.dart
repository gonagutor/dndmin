import 'package:dndmin/backend/dice.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/fonts/diceIcons.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:dndmin/ui/swipeUpMenu/throwDiceButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// PAra hacer un dismisable puedes subirlo a la mitad y que el resto de espacio lo ocupe un GestureDetector que detecte un toque y cambie el estado del tween
class SwipeUpMenu extends StatelessWidget {
  final UserData userData;
  final List<bool> iconState;
  SwipeUpMenu({
    @required this.userData,
    @required this.iconState,
  });
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
        iconState: iconState,
      ),
    );
  }
}

class MySwipeUpMenu extends StatefulWidget {
  MySwipeUpMenu({
    Key key,
    this.title,
    @required this.userData,
    @required this.iconState,
  }) : super(key: key);
  final String title;
  final UserData userData;
  final List<bool> iconState;
  @override
  _MySwipeUpMenuState createState() => _MySwipeUpMenuState(
        userData: userData,
        iconState: iconState,
      );
}

class _MySwipeUpMenuState extends State<MySwipeUpMenu> {
  final UserData userData;
  final List<bool> iconState;
  _MySwipeUpMenuState({@required this.userData, @required this.iconState});
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
        child: Column(
          children: [
            BottomBar(userData: userData, iconState: iconState),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Palette.fontColor,
                        ),
                        text: "Tirar un dado",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ThrowDiceButton(
                          onPressed: () async =>
                              await Throws.throwDice(4, userData),
                          icon: DiceIcons.dice_d4_bold,
                        ),
                        ThrowDiceButton(
                          onPressed: () async =>
                              await Throws.throwDice(6, userData),
                          icon: DiceIcons.dice_d6_bold,
                        ),
                        ThrowDiceButton(
                          onPressed: () async =>
                              await Throws.throwDice(8, userData),
                          icon: DiceIcons.dice_d8_bold,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ThrowDiceButton(
                          onPressed: () async =>
                              await Throws.throwDice(10, userData),
                          icon: DiceIcons.dice_d10_bold,
                        ),
                        ThrowDiceButton(
                          onPressed: () async =>
                              await Throws.throwDice(12, userData),
                          icon: DiceIcons.dice_d12_bold,
                        ),
                        ThrowDiceButton(
                          onPressed: () async =>
                              await Throws.throwDice(20, userData),
                          icon: DiceIcons.dice_d20_bold,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
