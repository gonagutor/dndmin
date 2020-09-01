import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/mainMenu.dart';
import 'package:dndmin/screens/personajeMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BBBState {
  bool active;
  IconData icon;
  Color topGradientColor;
  Color bottomGradientColor;
  Color iconTopColor;
  Color iconBottomColor;
  BBBState({
    this.active,
    this.icon,
  });
}

class GradientIconMask extends StatelessWidget {
  GradientIconMask({this.child, this.gradientTop, this.gradientBottom});
  final Widget child;
  final Color gradientTop;
  final Color gradientBottom;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment(0, -1),
        end: Alignment(0, 1),
        colors: <Color>[
          gradientTop,
          gradientBottom,
        ],
      ).createShader(bounds),
      child: child,
    );
  }
}

class BottomBarButton extends StatelessWidget {
  final BBBState state;
  final void Function() onPressed;
  BottomBarButton({@required this.state, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    if (state.active == false) {
      state.topGradientColor = Color(0xFFFFFFFF);
      state.bottomGradientColor = Color(0xFFFFFFFF);
      state.iconTopColor = Color(0xFFFF64E0);
      state.iconBottomColor = Color(0xFF46DAFF);
    } else {
      state.topGradientColor = Color(0xFFFF64E0);
      state.bottomGradientColor = Color(0xFF46DAFF);
      state.iconTopColor = Color(0xFFFFFFFF);
      state.iconBottomColor = Color(0xFFFFFFFF);
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 4), //(x,y)
              spreadRadius: 0,
              blurRadius: 5,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[
              state.topGradientColor,
              state.bottomGradientColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            FlatButton(
              onPressed: onPressed,
              color: Color(0x0091AAF3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
              child: Container(
                width: 60,
                height: 60,
              ),
            ),
            IgnorePointer(
              child: Align(
                alignment: Alignment.center,
                child: GradientIconMask(
                  child: Icon(
                    state.icon,
                    size: 35,
                    color: Colors.white,
                  ),
                  gradientBottom: state.iconBottomColor,
                  gradientTop: state.iconTopColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final List<bool> iconState;
  final UserData userData;
  BottomBar({@required this.iconState, @required this.userData});
  Widget build(BuildContext context) {
    return Container(
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
                gradientBottom: Color(0xFF46DAFF),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BottomBarButton(
                state: BBBState(active: iconState[0], icon: Icons.person),
                onPressed: () {
                  if (!iconState[0])
                    print('ButtonState: ' + iconState[0].toString());
                },
              ),
              BottomBarButton(
                state: BBBState(active: iconState[1], icon: Icons.camera_roll),
                onPressed: () {
                  if (!iconState[1])
                    runApp(PersonajeMenu(
                      userData: userData,
                    ));
                },
              ),
              BottomBarButton(
                state: BBBState(active: iconState[2], icon: Icons.home),
                onPressed: () {
                  if (!iconState[2])
                    runApp(MainMenu(
                      userData: userData,
                    ));
                },
              ),
              BottomBarButton(
                state: BBBState(active: iconState[3], icon: Icons.add),
                onPressed: () {
                  if (!iconState[3])
                    print('ButtonState: ' + iconState[3].toString());
                },
              ),
              BottomBarButton(
                state: BBBState(active: iconState[4], icon: Icons.headset),
                onPressed: () {
                  if (!iconState[4])
                    print('ButtonState: ' + iconState[4].toString());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
