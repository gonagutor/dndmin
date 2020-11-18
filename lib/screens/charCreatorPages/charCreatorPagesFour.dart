import 'package:dndmin/screens/charCreator.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesThree.dart';
import 'package:dndmin/ui/charCreatorPages/charCreatorPage.dart';
import 'package:flutter/material.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:flutter/services.dart';

class CharCreatorPagesFour extends StatelessWidget {
  final UserData userData;
  CharCreatorPagesFour({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharCreatorPagesFour(
        userData: userData,
      ),
    );
  }
}

class MyCharCreatorPagesFour extends StatefulWidget {
  final UserData userData;
  MyCharCreatorPagesFour({@required this.userData});
  @override
  _MyCharCreatorPagesFourState createState() =>
      _MyCharCreatorPagesFourState(userData: userData);
}

class _MyCharCreatorPagesFourState extends State<MyCharCreatorPagesFour> {
  final UserData userData;
  _MyCharCreatorPagesFourState({@required this.userData});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CharCreatorPage(
        nextPage: () => runApp(CharCreator(userData: userData)),
        prevPage: () => runApp(CharCreatorPagesThree(userData: userData)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Descripción",
                  style: TextStyle(
                    color: Palette.fontColor,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                "Introduce la descripción de tu personaje: personalidad, apariencia, motivaciones, ideales y defectos",
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TickableSkillCard extends StatelessWidget {
  final bool selected;
  final Function onSelected;
  final String text;
  const TickableSkillCard({
    @required this.selected,
    @required this.onSelected,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Palette.bottomGradient,
          borderRadius: BorderRadius.all(Palette.standardRadius),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Palette.topGradient,
              Palette.bottomGradient,
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.5),
              offset: Offset(0, -0.5), //(x,y)
              spreadRadius: 0.1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.all(Palette.standardRadius),
              ),
              child: Center(
                child: CustomCheckBox(
                  selected: selected,
                  onSelected: onSelected,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: (MediaQuery.of(context).size.width - 100) * 2 / 3,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final double height;
  final double width;
  final bool selected;
  final Function onSelected;
  CustomCheckBox({
    this.height = 48,
    this.width = 48,
    @required this.selected,
    @required this.onSelected,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: (selected) ? Palette.standardGradient : null,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: (selected)
            ? Icon(
                Icons.done,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
