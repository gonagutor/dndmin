import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final Function onPressed;
  SquareButton({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: FloatingActionButton(
        onPressed: onPressed,
      ),
    );
  }
}
