import 'package:dndmin/backend/skills.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/fonts/rpgAwesomeIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'thirdPage/abilityCard.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({
    @required this.playerSkills,
  });
  final PlayerSkills playerSkills;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Habilidades',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Palette.fontColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AbilityCard(
                  icon: RPGAwesome.underhand,
                  ability: 'Acrobacia',
                  usedStat: playerSkills.acrobacia,
                ),
                AbilityCard(
                  icon: RPGAwesome.player_dodge,
                  ability: 'Atletismo',
                  usedStat: playerSkills.atletismo,
                ),
                AbilityCard(
                  icon: RPGAwesome.burning_eye,
                  ability: 'Con. Arcano',
                  usedStat: playerSkills.conArcano,
                ),
                AbilityCard(
                  icon: RPGAwesome.speech_bubble,
                  ability: 'Engaño',
                  usedStat: playerSkills.engano,
                ),
                AbilityCard(
                  icon: RPGAwesome.book,
                  ability: 'Historia',
                  usedStat: playerSkills.acrobacia,
                ),
                AbilityCard(
                  icon: RPGAwesome.double_team,
                  ability: 'Interpretación',
                  usedStat: playerSkills.interpretacion,
                ),
                AbilityCard(
                  icon: RPGAwesome.muscle_fat,
                  ability: 'Intimidación',
                  usedStat: playerSkills.intimidacion,
                ),
                AbilityCard(
                  icon: RPGAwesome.nodular,
                  ability: 'Investigación',
                  usedStat: playerSkills.investigacion,
                ),
                AbilityCard(
                  icon: RPGAwesome.hearts_card,
                  ability: 'Juego de Manos',
                  usedStat: playerSkills.juegoManos,
                ),
                AbilityCard(
                  icon: RPGAwesome.pills,
                  ability: 'Medicina',
                  usedStat: playerSkills.medicina,
                ),
                AbilityCard(
                  icon: RPGAwesome.vine_whip,
                  ability: 'Naturaleza',
                  usedStat: playerSkills.naturaleza,
                ),
                AbilityCard(
                  icon: RPGAwesome.eyeball,
                  ability: 'Percepción',
                  usedStat: playerSkills.percepcion,
                ),
                AbilityCard(
                  icon: RPGAwesome.help,
                  ability: 'Perspicacia',
                  usedStat: playerSkills.perspicacia,
                ),
                AbilityCard(
                  icon: RPGAwesome.speech_bubbles,
                  ability: 'Persuasión',
                  usedStat: playerSkills.persuasion,
                ),
                AbilityCard(
                  icon: RPGAwesome.candle,
                  ability: 'Religión',
                  usedStat: playerSkills.religion,
                ),
                AbilityCard(
                  icon: RPGAwesome.doubled,
                  ability: 'Sigilo',
                  usedStat: playerSkills.sigilo,
                ),
                AbilityCard(
                  icon: RPGAwesome.droplet,
                  ability: 'Supervivencia',
                  usedStat: playerSkills.supervivencia,
                ),
                AbilityCard(
                  icon: RPGAwesome.horseshoe,
                  ability: 'T. Con Animales',
                  usedStat: playerSkills.tratoAnimales,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
