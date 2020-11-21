import 'package:dndmin/backend/raceAbilities.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/charAbilities/expandableItem.dart';
import 'package:flutter/material.dart';

class AbilitiesFirstPage extends StatelessWidget {
  final RaceAbilities raceAbilities;
  AbilitiesFirstPage({@required this.raceAbilities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> abList = [];
          List<Widget> abListSub = [];
          abListSub.add(
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Habilidades Sub Raza',
                style: TextStyle(
                  fontSize: 30,
                  color: Palette.fontColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
          for (int i = 0; i < raceAbilities.subRaceAbilities.length; i++)
            abListSub.add(ExpandableItem(
              description: raceAbilities.subRaceAbilities[i].description,
              name: raceAbilities.subRaceAbilities[i].name,
            ));
          abList.add(
            Padding(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Text(
                'Habilidades de Raza',
                style: TextStyle(
                  fontSize: 30,
                  color: Palette.fontColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
          for (int i = 0; i < raceAbilities.mainAbilities.length; i++)
            abList.add(ExpandableItem(
              description: raceAbilities.mainAbilities[i].description,
              name: raceAbilities.mainAbilities[i].name,
            ));
          return Column(
            children: [
              Column(
                children: abList,
              ),
              Column(
                children: abListSub,
              ),
            ],
          );
        },
      ),
    );
  }
}
