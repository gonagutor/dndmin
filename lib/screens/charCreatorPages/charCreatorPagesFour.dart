import 'package:dndmin/screens/charCreator.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesThree.dart';
import 'package:dndmin/ui/charCreatorPages/charCreatorPage.dart';
import 'package:flutter/material.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:flutter/services.dart';

TextEditingController _apariencia = TextEditingController();
TextEditingController _personalidad = TextEditingController();
TextEditingController _ideales = TextEditingController();
TextEditingController _vinculos = TextEditingController();
TextEditingController _defectos = TextEditingController();

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
  final _pageFourKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CharCreatorPage(
        nextPage: () {
          if (_pageFourKey.currentState.validate())
            runApp(CharCreator(userData: userData));
        },
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
            Form(
              key: _pageFourKey,
              child: Column(
                children: [
                  LongTextInput(
                    controller: _apariencia,
                    minLines: 2,
                    label: "Apariencia",
                    hintText: "Introduce tu apariencia",
                    validator: (value) {
                      if (value.isEmpty) return "Introduce tu aparaiencia";
                      return null;
                    },
                  ),
                  LongTextInput(
                    controller: _personalidad,
                    minLines: 2,
                    label: "Personalidad",
                    hintText: "Introduce tu personalidad",
                    validator: (value) {
                      if (value.isEmpty) return "Introduce tu personalidad";
                      return null;
                    },
                  ),
                  LongTextInput(
                    controller: _ideales,
                    minLines: 2,
                    label: "Ideales",
                    hintText: "Introduce tus Ideales",
                    validator: (value) {
                      if (value.isEmpty) return "Introduce tu personalidad";
                      return null;
                    },
                  ),
                  LongTextInput(
                    controller: _vinculos,
                    minLines: 2,
                    label: "Vinculos",
                    hintText: "Introduce tus Vinculos",
                    validator: (value) {
                      if (value.isEmpty) return "Introduce tu personalidad";
                      return null;
                    },
                  ),
                  LongTextInput(
                    controller: _defectos,
                    minLines: 2,
                    label: "Defectos",
                    hintText: "Introduce tus Defectos",
                    validator: (value) {
                      if (value.isEmpty) return "Introduce tu personalidad";
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LongTextInput extends StatelessWidget {
  final String label;
  final String hintText;
  final int minLines;
  final String Function(String) validator;
  final TextEditingController controller;
  LongTextInput({
    this.minLines = 1,
    this.validator,
    @required this.label,
    @required this.hintText,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            label,
            style: TextStyle(
              color: Palette.fontColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: TextFormField(
                  controller: controller,
                  validator: validator,
                  keyboardType: TextInputType.multiline,
                  minLines: minLines,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Palette.fontColor,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(fontSize: 18),
                    filled: true,
                    fillColor: Color(0xFFEFEFEF),
                    hoverColor: Color(0xFFEFEFEF),
                    focusColor: Color(0xFFEFEFEF),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
