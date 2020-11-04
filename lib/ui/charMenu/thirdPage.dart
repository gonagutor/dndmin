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
                  proficient: playerSkills.profAcrobacia,
                ),
                AbilityCard(
                  icon: RPGAwesome.player_dodge,
                  ability: 'Atletismo',
                  usedStat: playerSkills.atletismo,
                  proficient: playerSkills.profAtletismo,
                ),
                AbilityCard(
                  icon: RPGAwesome.burning_eye,
                  ability: 'Con. Arcano',
                  usedStat: playerSkills.conArcano,
                  proficient: playerSkills.profConArcano,
                ),
                AbilityCard(
                  icon: RPGAwesome.speech_bubble,
                  ability: 'Engaño',
                  usedStat: playerSkills.engano,
                  proficient: playerSkills.profEngano,
                ),
                AbilityCard(
                  icon: RPGAwesome.book,
                  ability: 'Historia',
                  usedStat: playerSkills.historia,
                  proficient: playerSkills.profHistoria,
                ),
                AbilityCard(
                  icon: RPGAwesome.double_team,
                  ability: 'Interpretación',
                  usedStat: playerSkills.interpretacion,
                  proficient: playerSkills.profInterpretacion,
                ),
                AbilityCard(
                  icon: RPGAwesome.muscle_fat,
                  ability: 'Intimidación',
                  usedStat: playerSkills.intimidacion,
                  proficient: playerSkills.profIntimidacion,
                ),
                AbilityCard(
                  icon: RPGAwesome.nodular,
                  ability: 'Investigación',
                  usedStat: playerSkills.investigacion,
                  proficient: playerSkills.profInvestigacion,
                ),
                AbilityCard(
                  icon: RPGAwesome.hearts_card,
                  ability: 'Juego de Manos',
                  usedStat: playerSkills.juegoManos,
                  proficient: playerSkills.profJuegoManos,
                ),
                AbilityCard(
                  icon: RPGAwesome.pills,
                  ability: 'Medicina',
                  usedStat: playerSkills.medicina,
                  proficient: playerSkills.profMedicina,
                ),
                AbilityCard(
                  icon: RPGAwesome.vine_whip,
                  ability: 'Naturaleza',
                  usedStat: playerSkills.naturaleza,
                  proficient: playerSkills.profNaturaleza,
                ),
                AbilityCard(
                  icon: RPGAwesome.eyeball,
                  ability: 'Percepción',
                  usedStat: playerSkills.percepcion,
                  proficient: playerSkills.profPercepcion,
                ),
                AbilityCard(
                  icon: RPGAwesome.help,
                  ability: 'Perspicacia',
                  usedStat: playerSkills.perspicacia,
                  proficient: playerSkills.profPerspicacia,
                ),
                AbilityCard(
                  icon: RPGAwesome.speech_bubbles,
                  ability: 'Persuasión',
                  usedStat: playerSkills.persuasion,
                  proficient: playerSkills.profPersuasion,
                ),
                AbilityCard(
                  icon: RPGAwesome.candle,
                  ability: 'Religión',
                  usedStat: playerSkills.religion,
                  proficient: playerSkills.profReligion,
                ),
                AbilityCard(
                  icon: RPGAwesome.doubled,
                  ability: 'Sigilo',
                  usedStat: playerSkills.sigilo,
                  proficient: playerSkills.profSigilo,
                ),
                AbilityCard(
                  icon: RPGAwesome.droplet,
                  ability: 'Supervivencia',
                  usedStat: playerSkills.supervivencia,
                  proficient: playerSkills.profSupervivencia,
                ),
                AbilityCard(
                  icon: RPGAwesome.horseshoe,
                  ability: 'T. Con Animales',
                  usedStat: playerSkills.tratoAnimales,
                  proficient: playerSkills.profTratoAnimales,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
