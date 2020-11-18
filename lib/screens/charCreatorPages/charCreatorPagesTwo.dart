import 'package:dndmin/fonts/rpgAwesomeIcons.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesOne.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesThree.dart';
import 'package:dndmin/ui/charCreatorPages/charCreatorPage.dart';
import 'package:flutter/material.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextEditingController _iniciativa = TextEditingController();
TextEditingController _vida = TextEditingController();
TextEditingController _ca = TextEditingController();
TextEditingController _velocidad = TextEditingController();
TextEditingController _fuerza = TextEditingController();
TextEditingController _destreza = TextEditingController();
TextEditingController _constitucion = TextEditingController();
TextEditingController _inteligencia = TextEditingController();
TextEditingController _sabiduria = TextEditingController();
TextEditingController _carisma = TextEditingController();

class CharCreatorPagesTwo extends StatelessWidget {
  final UserData userData;
  CharCreatorPagesTwo({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharCreatorPagesTwo(
        userData: userData,
      ),
    );
  }
}

class MyCharCreatorPagesTwo extends StatefulWidget {
  final UserData userData;
  MyCharCreatorPagesTwo({@required this.userData});
  @override
  _MyCharCreatorPagesTwoState createState() =>
      _MyCharCreatorPagesTwoState(userData: userData);
}

class _MyCharCreatorPagesTwoState extends State<MyCharCreatorPagesTwo> {
  final UserData userData;
  _MyCharCreatorPagesTwoState({@required this.userData});
  final _pageTwoKey = GlobalKey<FormState>();
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
          if (_pageTwoKey.currentState.validate())
            runApp(CharCreatorPagesThree(userData: userData));
        },
        prevPage: () => runApp(CharCreatorPagesOne(userData: userData)),
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
                  "Estadisticas de tu personaje",
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
                "Introduce tus estadisticas.\nNo te preocupes por lo que falte, se calculará solo",
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 16,
                ),
              ),
            ),
            Form(
              key: _pageTwoKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Caracteristicas",
                      style: TextStyle(
                        color: Palette.fontColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SquaredTextFormField(
                          icon: RPGAwesome.axe_swing,
                          text: "Fuerza",
                          controller: _fuerza,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SquaredTextFormField(
                            icon: RPGAwesome.feather_wing,
                            text: "Destreza",
                            controller: _destreza,
                          ),
                        ),
                        SquaredTextFormField(
                          icon: RPGAwesome.circular_shield,
                          text: "Constit.",
                          controller: _constitucion,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SquaredTextFormField(
                          icon: RPGAwesome.book,
                          text: "Intelig.",
                          controller: _inteligencia,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SquaredTextFormField(
                            icon: RPGAwesome.book,
                            text: "Sabiduría",
                            controller: _sabiduria,
                          ),
                        ),
                        SquaredTextFormField(
                          icon: RPGAwesome.mirror,
                          text: "Carisma",
                          controller: _carisma,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Estadisticas base",
                      style: TextStyle(
                        color: Palette.fontColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SquaredTextFormField(
                          icon: RPGAwesome.boot_stomp,
                          text: "Iniciativa",
                          controller: _iniciativa,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SquaredTextFormField(
                            icon: RPGAwesome.potion,
                            text: "Vida",
                            controller: _vida,
                          ),
                        ),
                        SquaredTextFormField(
                          icon: FontAwesomeIcons.shieldVirus,
                          text: "Clase Arm",
                          controller: _ca,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: Text(
                      "Velocidad",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF707070)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 80) / 3,
                          child: Icon(
                            RPGAwesome.player_dodge,
                            size: 80,
                            color: Palette.fontColor,
                          ),
                        ),
                        Container(
                          width: ((MediaQuery.of(context).size.width - 80) / 3 -
                                  10) *
                              2,
                          child: TextFormField(
                            controller: _velocidad,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[0-9]+$'))
                            ],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50,
                              color: Palette.fontColor,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Introduce tu velocidad';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                              hintText: "Velocidad",
                              hintStyle: TextStyle(fontSize: 30),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquaredTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String text;
  const SquaredTextFormField({
    @required this.icon,
    @required this.controller,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 80) / 3 - 10;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF707070)),
            ),
          ),
          Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              color: const Color(0xFFEFEFEF),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    icon,
                    size: width - 20,
                    color: Color(0xFFDDDDDD),
                  ),
                ),
                Center(
                  child: TextFormField(
                    controller: controller,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9+-]+$'))
                    ],
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Introduce tu ' + this.text;
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 50,
                      color: Palette.fontColor,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      hintText: '±0',
                      filled: true,
                      fillColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
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
      ),
    );
  }
}
