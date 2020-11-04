import 'package:flutter/material.dart';

class SwipableCard extends StatelessWidget {
  final Widget child;
  final int offView;
  SwipableCard({this.child, this.offView});
  @override
  Widget build(BuildContext context) {
    var leftPos = (offView == 0)
        ? 17.5
        : (offView == -1)
            ? -MediaQuery.of(context).size.width - 17.5
            : MediaQuery.of(context).size.width + 17.5;
    var rightPos = (offView == 0)
        ? 17.5
        : (offView == -1)
            ? MediaQuery.of(context).size.width + 17.5
            : -MediaQuery.of(context).size.width - 17.5;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      top: 190,
      bottom: 100,
      left: leftPos,
      right: rightPos,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOutExpo,
        opacity: (offView != 0) ? 0 : 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(0, -0.5), //(x,y)
                spreadRadius: 0.6,
                blurRadius: 6,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
