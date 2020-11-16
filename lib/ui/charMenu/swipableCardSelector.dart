import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';

class SwipableCardSelector extends StatelessWidget {
  final List<bool> current;
  final List<Function> onPressed;
  final List<String> labels;

  SwipableCardSelector({
    @required this.current,
    @required this.onPressed,
    @required this.labels,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SWCButton(
                  selected: current[0],
                  onPressed: onPressed[0],
                  child: Text(labels[0]),
                ),
              ],
            ),
            Column(
              children: [
                SWCButton(
                  selected: current[1],
                  onPressed: onPressed[1],
                  child: Text(labels[1]),
                ),
              ],
            ),
            Column(
              children: [
                SWCButton(
                  selected: current[2],
                  onPressed: onPressed[2],
                  child: Text(labels[2]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SWCButton extends StatelessWidget {
  final bool selected;
  final Function onPressed;
  final Widget child;
  SWCButton({
    this.selected = false,
    this.onPressed,
    @required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        height: 60,
        width: (MediaQuery.of(context).size.width - 97.5 - 63.5) / 3,
        child: Stack(children: [
          Center(child: child),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: (selected) ? 5 : 0,
              color: (selected) ? Palette.topGradient : Palette.bottomGradient,
            ),
          )
        ]),
      ),
    );
  }
}
