import 'package:dndmin/screens/charCreator.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesTwo.dart';
import 'package:dndmin/ui/charCreatorPages/charCreatorPage.dart';
import 'package:dndmin/ui/utilities/customDropdown.dart' as CDD;
import 'package:dndmin/ui/utilities/customDropdown.dart' as CDD2;
import 'package:flutter/material.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/screens/charSelector.dart';
import 'package:flutter/services.dart';

TextEditingController charName = TextEditingController();
TextEditingController charSubName = TextEditingController();
List<bool> isSelectedCla = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
List<bool> isSelectedRace = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
List<String> itemNamesCla = [
  "Monje",
  "Explorador",
  "Bardo",
  "Guerrero",
  "Mago",
  "Paladin",
  "Druida",
  "Pícaro",
  "Bárbaro",
  "Clérigo",
  "Hechicero",
];
List<String> itemNamesRace = [
  "EnanoM",
  "Elfo",
  "Mediano",
  "Dracónido",
  "Gnomo",
  "Semielfo",
  "Semiorco",
  "Tiflin",
];
int charClass = 0;
int charRace = 0;

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

    void _flipAll(List<bool> isSelected, int pressed) {
      int x = 0;
      while (isSelected.length > x) {
        isSelected[x] = (pressed != x) ? false : true;
        x++;
      }
      setState(() => isSelected = isSelected);
    }

    int _currentlySelected(List<bool> isSelected) {
      int x = 0;
      while (isSelected.length > x) {
        if (isSelected[x] == true) return (x);
        x++;
      }
      return x - 1;
    }

    bool _allFalse(List<bool> isSelected) {
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
        nextPage: () => runApp(CharCreatorPagesTwo(userData: userData)),
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
                            'Raza de tu personaje',
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
                          text: (_allFalse(isSelectedCla))
                              ? "Selecciona tu clase"
                              : itemNamesCla[_currentlySelected(isSelectedCla)],
                          items: [
                            CDD.DropDownItem.first(
                              text: itemNamesCla[0],
                              isSelected: isSelectedCla[0],
                              onPressed: isSelectedCla[0]
                                  ? null
                                  : () {
                                      charClass = 1;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 0);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[1],
                              isSelected: isSelectedCla[1],
                              onPressed: isSelectedCla[1]
                                  ? null
                                  : () {
                                      charClass = 2;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 1);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[2],
                              isSelected: isSelectedCla[2],
                              onPressed: isSelectedCla[2]
                                  ? null
                                  : () {
                                      charClass = 3;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 2);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[3],
                              isSelected: isSelectedCla[3],
                              onPressed: isSelectedCla[3]
                                  ? null
                                  : () {
                                      charClass = 4;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 3);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[4],
                              isSelected: isSelectedCla[4],
                              onPressed: isSelectedCla[4]
                                  ? null
                                  : () {
                                      charClass = 5;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 4);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[5],
                              isSelected: isSelectedCla[5],
                              onPressed: isSelectedCla[5]
                                  ? null
                                  : () {
                                      charClass = 6;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 5);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[6],
                              isSelected: isSelectedCla[6],
                              onPressed: isSelectedCla[6]
                                  ? null
                                  : () {
                                      charClass = 7;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 6);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[7],
                              isSelected: isSelectedCla[7],
                              onPressed: isSelectedCla[7]
                                  ? null
                                  : () {
                                      charClass = 8;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 7);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[8],
                              isSelected: isSelectedCla[8],
                              onPressed: isSelectedCla[8]
                                  ? null
                                  : () {
                                      charClass = 9;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 8);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: itemNamesCla[9],
                              isSelected: isSelectedCla[9],
                              onPressed: isSelectedCla[9]
                                  ? null
                                  : () {
                                      charClass = 10;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 9);
                                    },
                            ),
                            CDD.DropDownItem.last(
                              text: itemNamesCla[10],
                              isSelected: isSelectedCla[10],
                              onPressed: isSelectedCla[10]
                                  ? null
                                  : () {
                                      charClass = 11;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(isSelectedCla, 10);
                                    },
                            )
                          ],
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
                            'Raza de tu personaje',
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
                        child: CDD2.CustomDropdown(
                          text: (_allFalse(isSelectedRace))
                              ? "Selecciona tu Raza"
                              : itemNamesRace[
                                  _currentlySelected(isSelectedRace)],
                          items: [
                            CDD2.DropDownItem.first(
                              text: itemNamesRace[0],
                              isSelected: isSelectedRace[0],
                              onPressed: isSelectedRace[0]
                                  ? null
                                  : () {
                                      charClass = 1;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(isSelectedRace, 0);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: itemNamesRace[1],
                              isSelected: isSelectedRace[1],
                              onPressed: isSelectedRace[1]
                                  ? null
                                  : () {
                                      charRace = 2;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(isSelectedRace, 1);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: itemNamesRace[2],
                              isSelected: isSelectedRace[2],
                              onPressed: isSelectedRace[2]
                                  ? null
                                  : () {
                                      charRace = 3;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(isSelectedRace, 2);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: itemNamesRace[3],
                              isSelected: isSelectedRace[3],
                              onPressed: isSelectedRace[3]
                                  ? null
                                  : () {
                                      charRace = 4;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(isSelectedRace, 3);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: itemNamesRace[4],
                              isSelected: isSelectedRace[4],
                              onPressed: isSelectedRace[4]
                                  ? null
                                  : () {
                                      charRace = 5;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(isSelectedRace, 4);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: itemNamesRace[5],
                              isSelected: isSelectedRace[5],
                              onPressed: isSelectedRace[5]
                                  ? null
                                  : () {
                                      charRace = 6;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(isSelectedRace, 5);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: itemNamesRace[6],
                              isSelected: isSelectedRace[6],
                              onPressed: isSelectedRace[6]
                                  ? null
                                  : () {
                                      charRace = 7;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(isSelectedRace, 6);
                                    },
                            ),
                            CDD2.DropDownItem.last(
                              text: itemNamesRace[7],
                              isSelected: isSelectedRace[7],
                              onPressed: isSelectedRace[7]
                                  ? null
                                  : () {
                                      charRace = 8;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(isSelectedRace, 7);
                                    },
                            ),
                          ],
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
                            hintText: 'Introduce el nombre de tu personaje',
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
                            'Apellidos o mote',
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
                          controller: charSubName,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Introduce tu mote o apellidos';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Introduce tu mote o apellidos',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
