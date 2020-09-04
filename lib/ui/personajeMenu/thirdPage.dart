import 'package:dndmin/backend/skills.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/extensions/all.dart';
import 'package:dndmin/fonts/rpgAwesomeIcons.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:dndmin/ui/personajeMenu/secondPageWidgets/all.dart';
import 'package:dndmin/ui/personajeMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class AbilityCard extends StatelessWidget {
  const AbilityCard(
      {@required this.ability, @required this.icon, @required this.usedStat});
  final IconData icon;
  final String usedStat;
  final String ability;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Palette.standardRadius),
        child: Stack(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 33.3 * 2 - 10),
              height: (MediaQuery.of(context).size.width - 33.3 * 2 - 150) / 3,
              decoration: BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.all(Palette.standardRadius),
              ),
            ),
            Row(
              children: [
                Container(
                  width:
                      (MediaQuery.of(context).size.width - 33.3 * 2 - 150) / 3,
                  height:
                      (MediaQuery.of(context).size.width - 33.3 * 2 - 150) / 3,
                  decoration: BoxDecoration(
                    color: Palette.secondaryColor,
                    borderRadius: BorderRadius.all(Palette.standardRadius),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.5),
                        offset: Offset(0, -0.5), //(x,y)
                        spreadRadius: 0.1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: GradientIconMask(
                    gradientTop: Palette.topGradient,
                    gradientBottom: Palette.bottomGradient,
                    child: Icon(
                      icon,
                      size:
                          (MediaQuery.of(context).size.width - 33.3 * 2 - 150) /
                                  3 -
                              20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  width: (MediaQuery.of(context).size.width - 33.3 * 2 - 75),
                  height:
                      (MediaQuery.of(context).size.width - 33.3 * 2 - 150) / 3,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            ability,
                            style: TextStyle(
                              color: Palette.fontColor,
                              fontSize: (MediaQuery.of(context).size.width -
                                          33.3 * 2 -
                                          150) /
                                      3 -
                                  40,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            int.parse(usedStat).modToString(),
                            style: TextStyle(
                              color: Palette.fontColor,
                              fontWeight: FontWeight.bold,
                              fontSize: (MediaQuery.of(context).size.width -
                                          33.3 * 2 -
                                          150) /
                                      3 -
                                  15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
