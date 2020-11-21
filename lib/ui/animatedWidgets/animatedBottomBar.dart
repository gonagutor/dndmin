import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/swipeUpMenu.dart';
import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  final UserData userData;
  final List<bool> buttonState;
  AnimatedBottomBar({
    @required this.userData,
    @required this.buttonState,
  });
  @override
  _AnimatedBottomBarState createState() =>
      _AnimatedBottomBarState(userData: userData, buttonState: buttonState);
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  final UserData userData;
  final List<bool> buttonState;
  _AnimatedBottomBarState({
    @required this.userData,
    @required this.buttonState,
  });

  bool menuOpen = false;
  double sensitivity = 500.0;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      bottom: (menuOpen) ? 0 : -MediaQuery.of(context).size.height + 90,
      top: (menuOpen) ? -90 : MediaQuery.of(context).size.height - 90,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy < -sensitivity)
            setState(() {
              menuOpen = true;
            });
          else if (details.velocity.pixelsPerSecond.dy > sensitivity)
            setState(() {
              menuOpen = false;
            });
        },
        child: Stack(
          children: [
            SwipeUpMenu(
              userData: userData,
              iconState: buttonState,
            ),
          ],
        ),
      ),
    );
  }
}
