import 'package:dndmin/screens/charCreator.dart';
import 'package:dndmin/ui/charCreatorPages/charCreatorPage.dart';
import 'package:dndmin/ui/utilities/customDropdown.dart' as CDD;
import 'package:flutter/material.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/screens/charSelector.dart';
import 'package:flutter/services.dart';

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
  List<bool> isSelected = [false, false, false, false, false];
  List<String> itemNames = [
    "Hola, soy el item 1",
    "Hola, soy el item 2",
    "Hola, soy el item 3",
    "Hola, soy el item 4",
    "Hola, soy el item 5",
  ];
  _MyCharCreatorPagesOneState({@required this.userData});
  @override
  Widget build(BuildContext context) {
    GlobalKey _pageOneKey = GlobalKey<FormState>();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    void _flipAll(int pressed) {
      int x = 0;
      while (isSelected.length > x) {
        isSelected[x] = (pressed != x) ? false : true;
        x++;
      }
      setState(() => isSelected = isSelected);
    }

    int _currentlySelected() {
      int x = 0;
      while (isSelected.length > x) {
        if (isSelected[x] == true) return (x);
        x++;
      }
      return x - 1;
    }

    bool _allFalse() {
      int x = 0;
      int i = 0;
      while (isSelected.length > x) {
        if (isSelected[x] == false) i++;
        x++;
      }
      if (isSelected.length == i) return true;
      return false;
    }

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
                              color: const Color(0xFF707070),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: CDD.CustomDropdown(
                          text: (_allFalse())
                              ? "Selecciona tu clase"
                              : itemNames[_currentlySelected()],
                          items: [
                            CDD.DropDownItem.first(
                              text: itemNames[0],
                              isSelected: isSelected[0],
                              onPressed: isSelected[0]
                                  ? null
                                  : () {
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(0);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNames[1],
                              isSelected: isSelected[1],
                              onPressed: isSelected[1]
                                  ? null
                                  : () {
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(1);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNames[2],
                              isSelected: isSelected[2],
                              onPressed: isSelected[2]
                                  ? null
                                  : () {
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(2);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNames[3],
                              isSelected: isSelected[3],
                              onPressed: isSelected[3]
                                  ? null
                                  : () {
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(3);
                                    },
                            ),
                            CDD.DropDownItem.last(
                              text: itemNames[4],
                              isSelected: isSelected[4],
                              onPressed: isSelected[4]
                                  ? null
                                  : () {
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(4);
                                    },
                            )
                          ],
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
