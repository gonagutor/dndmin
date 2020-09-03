import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';

class LifeIndicator extends StatelessWidget {
  LifeIndicator(
      {@required this.currentLife,
      @required this.maxLife,
      @required this.playerIndicator});
  final Widget playerIndicator;
  final int maxLife;
  final int currentLife;
  @override
  Widget build(BuildContext context) {
    Color colorIndicator = Palette.bottomGradient;
    if (maxLife / 3 >= currentLife)
      colorIndicator = Palette.topGradient;
    else if (maxLife / 2 >= currentLife)
      colorIndicator =
          Color.lerp(Palette.topGradient, Palette.bottomGradient, 0.5);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: (MediaQuery.of(context).size.width / 3),
          height: (MediaQuery.of(context).size.width / 3),
          decoration: BoxDecoration(
            color: Palette.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(90)),
            boxShadow: Palette.standartShadow,
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width:
              (MediaQuery.of(context).size.width / 3) * (currentLife / maxLife),
          height:
              (MediaQuery.of(context).size.width / 3) * (currentLife / maxLife),
          decoration: BoxDecoration(
            color: colorIndicator,
            borderRadius: BorderRadius.all(Radius.circular(90)),
          ),
          child: Center(child: playerIndicator),
        ),
      ],
    );
  }
}
