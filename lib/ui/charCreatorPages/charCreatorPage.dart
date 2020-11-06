import 'package:dndmin/ui/charCreatorPages/nextButton.dart';
import 'package:dndmin/ui/charCreatorPages/prevButton.dart';
import 'package:flutter/material.dart';
import 'package:dndmin/config/palette.dart';

class CharCreatorPage extends StatelessWidget {
  final Function prevPage;
  final Function nextPage;
  final Widget child;
  CharCreatorPage(
      {@required this.nextPage, @required this.prevPage, @required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Palette.topGradient, Palette.bottomGradient],
          stops: [0.0, 1.0],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: Palette.standartShadow,
              borderRadius: BorderRadius.all(Palette.standardRadius),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Palette.standardRadius),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 90.0),
                      child: child,
                    ),
                  ),
                ),
                PrevButton(
                  prevPage: prevPage,
                ),
                NextButton(
                  nextPage: nextPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
