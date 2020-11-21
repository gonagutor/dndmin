import 'package:dndmin/backend/createPlayer.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesFour.dart';
import 'package:dndmin/screens/charCreatorPages/charCreatorPagesTwo.dart';
import 'package:dndmin/ui/charCreatorPages/charCreatorPage.dart';
import 'package:flutter/material.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:flutter/services.dart';

List<bool> _characteristicsSelected = [
  false,
  false,
  false,
  false,
  false,
  false,
];
List<String> _characteristicsNames = [
  "Fuerza",
  "Destreza",
  "Constitución",
  "Inteligencia",
  "Sabiduría",
  "Carisma",
];
List<bool> _abiliesSelected = [
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
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
List<String> _abiliesNames = [
  "Acrobacias",
  "Conocimiento Arcano",
  "Atletismo",
  "Engaño",
  "Historia",
  "Interpretación",
  "Intimidación",
  "Investigación",
  "Juego de Manos",
  "Medicina",
  "Naturaleza",
  "Percepción",
  "Perspicacia",
  "Persuasión",
  "Religión",
  "Sigilo",
  "Supervivencia",
  "Trato con Animales",
];

class CharCreatorPagesThree extends StatelessWidget {
  final UserData userData;
  CharCreatorPagesThree({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharCreatorPagesThree(
        userData: userData,
      ),
    );
  }
}

class MyCharCreatorPagesThree extends StatefulWidget {
  final UserData userData;
  MyCharCreatorPagesThree({@required this.userData});
  @override
  _MyCharCreatorPagesThreeState createState() =>
      _MyCharCreatorPagesThreeState(userData: userData);
}

class _MyCharCreatorPagesThreeState extends State<MyCharCreatorPagesThree> {
  final UserData userData;
  _MyCharCreatorPagesThreeState({@required this.userData});
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
          PlayerCreator.proficienciasHab = _abiliesSelected;
          PlayerCreator.proficienciasSalv = _characteristicsSelected;
          runApp(CharCreatorPagesFour(userData: userData));
        },
        prevPage: () => runApp(CharCreatorPagesTwo(userData: userData)),
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
                  "Proficiencias",
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
                "Selecciona las habilidades y caracteristicas de salvación en las que tienes proficiencia.",
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Tiradas de salvación",
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Builder(
              builder: (BuildContext context) {
                List<Widget> tickboxes = [];
                for (int i = 0; i < _characteristicsNames.length; i++)
                  tickboxes.add(TickableSkillCard(
                    text: _characteristicsNames[i],
                    selected: _characteristicsSelected[i],
                    onSelected: () => setState(() {
                      _characteristicsSelected[i] =
                          !_characteristicsSelected[i];
                    }),
                  ));
                return Column(
                  children: tickboxes,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Habilidades",
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Builder(
              builder: (BuildContext context) {
                List<Widget> tickboxes = [];
                for (int i = 0; i < _abiliesNames.length; i++)
                  tickboxes.add(TickableSkillCard(
                    text: _abiliesNames[i],
                    selected: _abiliesSelected[i],
                    onSelected: () => setState(() {
                      _abiliesSelected[i] = !_abiliesSelected[i];
                    }),
                  ));
                return Column(
                  children: tickboxes,
                );
              },
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
