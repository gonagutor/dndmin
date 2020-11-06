import 'package:dndmin/screens/charCreator.dart';
import 'package:dndmin/ui/charCreatorPages/charCreatorPage.dart';
import 'package:flutter/material.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/screens/charSelector.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextEditingController charName = TextEditingController();
int charClass = 1;

class CharCreatorPagesOne extends StatelessWidget {
  final UserData userData;
  CharCreatorPagesOne({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharCreatorPagesOne(
        userData: userData,
      ),
    );
  }
}

class MyCharCreatorPagesOne extends StatefulWidget {
  final UserData userData;
  MyCharCreatorPagesOne({@required this.userData});
  @override
  _MyCharCreatorPagesOneState createState() =>
      _MyCharCreatorPagesOneState(userData: userData);
}

class _MyCharCreatorPagesOneState extends State<MyCharCreatorPagesOne> {
  final UserData userData;
  _MyCharCreatorPagesOneState({@required this.userData});
  @override
  Widget build(BuildContext context) {
    GlobalKey _pageOneKey = GlobalKey<FormState>();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CharCreatorPage(
        nextPage: () => runApp(CharSelector(userData: userData)),
        prevPage: () => runApp(CharCreator(userData: userData)),
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
                  "Información ",
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
                "Para empezar introduce tu nombre y los detalles iniciales de tu personaje.",
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 16,
                ),
              ),
            ),
            Form(
              key: _pageOneKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nombre de tu personaje',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF707070)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: TextFormField(
                          controller: charName,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Introduce el nombre de tu personaje';
                            } else if (value.length > 17) {
                              return 'Tu nombre de personaje debe tener menos de 16 caracteres';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            filled: true,
                            fillColor: const Color(0xFFEFEFEF),
                            hoverColor: const Color(0xFFEFEFEF),
                            focusColor: const Color(0xFFEFEFEF),
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
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Clase de tu personaje',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF707070)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEFEF),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.all(20.0),
                          child: DropdownButton(
                              icon: Icon(FontAwesomeIcons.caretDown),
                              iconSize: 25,
                              value: charClass,
                              items: [
                                DropdownMenuItem(
                                  child: Text("First Item"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Second Item"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                    child: Text("Third Item"), value: 3),
                                DropdownMenuItem(
                                    child: Text("Fourth Item"), value: 4)
                              ],
                              onChanged: (value) =>
                                  setState(() => charClass = value)),
                        ),
                      ),
                    ],
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
