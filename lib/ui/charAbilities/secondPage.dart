import 'package:dndmin/backend/classAbilities.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/charAbilities/expandableItem.dart';
import 'package:flutter/material.dart';

class AbilitiesSecondPage extends StatelessWidget {
  final ClassAbilities classAbilities;
  AbilitiesSecondPage({@required this.classAbilities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> abList = [];
          if (classAbilities.habilidadesDeClase != null) {
            abList.add(
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Habilidades de clase',
                  style: TextStyle(
                    fontSize: 30,
                    color: Palette.fontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
            for (int i = 0; i < classAbilities.habilidadesDeClase.length; i++)
              abList.add(
                ExpandableItem(
                  description:
                      classAbilities.habilidadesDeClase[i].habilityDescription,
                  name: classAbilities.habilidadesDeClase[i].habilityName,
                ),
              );
          }
          return Column(
            children: [
              Column(
                children: abList,
              ),
            ],
          );
        },
      ),
    );
  }
}
