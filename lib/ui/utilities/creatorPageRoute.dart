import 'package:flutter/material.dart';

class CreatorPageRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  final bool reverse;
  CreatorPageRoute({
    @required this.exitPage,
    @required this.enterPage,
    this.reverse = false,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: Offset((reverse) ? 1.0 : -1.0, 0.0),
                ).chain(CurveTween(curve: Curves.ease)).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset((reverse) ? -1.0 : 1.0, 0.0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.ease)).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}
