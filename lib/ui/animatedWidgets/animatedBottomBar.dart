import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/swipeUpMenu.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      bottom: 0,
      top: (menuOpen) ? -90 : MediaQuery.of(context).size.height - 90,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanEnd: (details) {
          print(details.velocity.pixelsPerSecond.dy);
          if (details.velocity.pixelsPerSecond.dy < -sensitivity)
            setState(() {
              menuOpen = true;
            });
          else if (details.velocity.pixelsPerSecond.dy > sensitivity)
            setState(() {
              menuOpen = false;
            });
        },
        child: (menuOpen)
            ? Stack(
                children: [
                  SwipeUpMenu(
                    userData: userData,
                  ),
                  Positioned(
                    bottom: 0,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientIconMask(
                              child: Icon(
                                FontAwesomeIcons.chevronUp,
                                color: Colors.white,
                                size: 15,
                              ),
                              gradientTop: Color(0xFFFF64E0),
                              gradientBottom: Color(0xFFD1EAF0),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            BottomBarButton(
                              state: BBBState(
                                  active: buttonState[0], icon: Icons.person),
                              onPressed: () {},
                            ),
                            BottomBarButton(
                              state: BBBState(
                                  active: buttonState[1],
                                  icon: Icons.camera_roll),
                              onPressed: () {},
                            ),
                            BottomBarButton(
                              state: BBBState(
                                  active: buttonState[2], icon: Icons.home),
                              onPressed: () {},
                            ),
                            BottomBarButton(
                              state: BBBState(
                                  active: buttonState[3], icon: Icons.add),
                              onPressed: () {},
                            ),
                            BottomBarButton(
                              state: BBBState(
                                  active: buttonState[4], icon: Icons.headset),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : BottomBar(userData: userData, iconState: buttonState),
      ),
    );
  }
}
