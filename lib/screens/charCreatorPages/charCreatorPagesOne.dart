import 'package:dndmin/backend/createPlayer.dart';
import 'package:dndmin/screens/charCreator.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesTwo.dart';
import 'package:dndmin/ui/charCreatorPages/charCreatorPage.dart';
import 'package:dndmin/ui/utilities/customDropdown.dart' as CDD;
import 'package:dndmin/ui/utilities/customDropdown.dart' as CDD2;
import 'package:flutter/material.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:flutter/services.dart';

TextEditingController _charName = TextEditingController();
TextEditingController _charSubName = TextEditingController();
List<bool> _isSelectedCla = [
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
List<bool> _isSelectedRace = [
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
List<String> _itemNamesCla = [
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
List<String> _itemNamesRace = [
  "Enano",
  "Elfo",
  "Mediano",
  "Dracónido",
  "Gnomo",
  "Semielfo",
  "Semiorco",
  "Tiflin",
];
int _charClass = 0;
int _charRace = 0;

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
  final _pageOneKey = GlobalKey<FormState>();
  bool _verifiedCla = true;
  bool _verifiedRace = true;
  @override
  Widget build(BuildContext context) {
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
      resizeToAvoidBottomInset: true,
      body: CharCreatorPage(
        nextPage: () {
          setState(() => _verifiedCla = !_allFalse(_isSelectedCla));
          setState(() => _verifiedRace = !_allFalse(_isSelectedRace));
          if (_pageOneKey.currentState.validate()) {
            if (_verifiedCla && _verifiedRace) {
              PlayerCreator.clase = _itemNamesCla[_charClass - 1];
              PlayerCreator.race = _itemNamesRace[_charRace - 1];
              PlayerCreator.nombre = _charName.text
                  .replaceAll('\'', '\\\'')
                  .replaceAll("\"", "\\\"");
              PlayerCreator.subNombre = _charSubName.text
                  .replaceAll('\'', '\\\'')
                  .replaceAll("\"", "\\\"");
              runApp(CharCreatorPagesTwo(userData: userData));
            }
          }
        },
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
                          text: (_allFalse(_isSelectedCla))
                              ? "Selecciona tu clase"
                              : _itemNamesCla[
                                  _currentlySelected(_isSelectedCla)],
                          items: [
                            CDD.DropDownItem.first(
                              text: _itemNamesCla[0],
                              isSelected: _isSelectedCla[0],
                              onPressed: _isSelectedCla[0]
                                  ? null
                                  : () {
                                      _charClass = 1;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 0);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[1],
                              isSelected: _isSelectedCla[1],
                              onPressed: _isSelectedCla[1]
                                  ? null
                                  : () {
                                      _charClass = 2;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 1);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[2],
                              isSelected: _isSelectedCla[2],
                              onPressed: _isSelectedCla[2]
                                  ? null
                                  : () {
                                      _charClass = 3;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 2);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[3],
                              isSelected: _isSelectedCla[3],
                              onPressed: _isSelectedCla[3]
                                  ? null
                                  : () {
                                      _charClass = 4;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 3);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[4],
                              isSelected: _isSelectedCla[4],
                              onPressed: _isSelectedCla[4]
                                  ? null
                                  : () {
                                      _charClass = 5;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 4);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[5],
                              isSelected: _isSelectedCla[5],
                              onPressed: _isSelectedCla[5]
                                  ? null
                                  : () {
                                      _charClass = 6;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 5);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[6],
                              isSelected: _isSelectedCla[6],
                              onPressed: _isSelectedCla[6]
                                  ? null
                                  : () {
                                      _charClass = 7;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 6);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[7],
                              isSelected: _isSelectedCla[7],
                              onPressed: _isSelectedCla[7]
                                  ? null
                                  : () {
                                      _charClass = 8;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 7);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[8],
                              isSelected: _isSelectedCla[8],
                              onPressed: _isSelectedCla[8]
                                  ? null
                                  : () {
                                      _charClass = 9;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 8);
                                    },
                            ),
                            CDD.DropDownItem(
                              text: _itemNamesCla[9],
                              isSelected: _isSelectedCla[9],
                              onPressed: _isSelectedCla[9]
                                  ? null
                                  : () {
                                      _charClass = 10;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 9);
                                    },
                            ),
                            CDD.DropDownItem.last(
                              text: _itemNamesCla[10],
                              isSelected: _isSelectedCla[10],
                              onPressed: _isSelectedCla[10]
                                  ? null
                                  : () {
                                      _charClass = 11;
                                      CDD.isDropdownOpened =
                                          !CDD.isDropdownOpened;
                                      CDD.floatingDropdown.remove();
                                      _flipAll(_isSelectedCla, 10);
                                    },
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 28,
                            ),
                            child: Text(
                              'Selecciona una clase',
                              style: TextStyle(
                                color: Colors.red[400],
                                fontSize: (_verifiedCla) ? 0 : 13,
                              ),
                            ),
                          ),
                        ],
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
                          text: (_allFalse(_isSelectedRace))
                              ? "Selecciona tu Raza"
                              : _itemNamesRace[
                                  _currentlySelected(_isSelectedRace)],
                          items: [
                            CDD2.DropDownItem.first(
                              text: _itemNamesRace[0],
                              isSelected: _isSelectedRace[0],
                              onPressed: _isSelectedRace[0]
                                  ? null
                                  : () {
                                      _charClass = 1;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(_isSelectedRace, 0);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: _itemNamesRace[1],
                              isSelected: _isSelectedRace[1],
                              onPressed: _isSelectedRace[1]
                                  ? null
                                  : () {
                                      _charRace = 2;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(_isSelectedRace, 1);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: _itemNamesRace[2],
                              isSelected: _isSelectedRace[2],
                              onPressed: _isSelectedRace[2]
                                  ? null
                                  : () {
                                      _charRace = 3;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(_isSelectedRace, 2);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: _itemNamesRace[3],
                              isSelected: _isSelectedRace[3],
                              onPressed: _isSelectedRace[3]
                                  ? null
                                  : () {
                                      _charRace = 4;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(_isSelectedRace, 3);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: _itemNamesRace[4],
                              isSelected: _isSelectedRace[4],
                              onPressed: _isSelectedRace[4]
                                  ? null
                                  : () {
                                      _charRace = 5;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(_isSelectedRace, 4);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: _itemNamesRace[5],
                              isSelected: _isSelectedRace[5],
                              onPressed: _isSelectedRace[5]
                                  ? null
                                  : () {
                                      _charRace = 6;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(_isSelectedRace, 5);
                                    },
                            ),
                            CDD2.DropDownItem(
                              text: _itemNamesRace[6],
                              isSelected: _isSelectedRace[6],
                              onPressed: _isSelectedRace[6]
                                  ? null
                                  : () {
                                      _charRace = 7;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(_isSelectedRace, 6);
                                    },
                            ),
                            CDD2.DropDownItem.last(
                              text: _itemNamesRace[7],
                              isSelected: _isSelectedRace[7],
                              onPressed: _isSelectedRace[7]
                                  ? null
                                  : () {
                                      _charRace = 8;
                                      CDD2.isDropdownOpened =
                                          !CDD2.isDropdownOpened;
                                      CDD2.floatingDropdown.remove();
                                      _flipAll(_isSelectedRace, 7);
                                    },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 28,
                            ),
                            child: Text(
                              'Selecciona una raza',
                              style: TextStyle(
                                color: Colors.red[400],
                                fontSize: (_verifiedRace) ? 0 : 13,
                              ),
                            ),
                          ),
                        ],
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
                          controller: _charName,
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
                          controller: _charSubName,
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
