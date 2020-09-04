import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dndmin/extensions/toBool.dart';

class Skills {
  List<PlayerSkills> skills;

  Skills({this.skills});

  static Future<Skills> getStats(String uToken, int id /*Remuv*/) async {
    var url = 'http://dndgonzalo.ddns.net/api-call.php?token=' +
        uToken.toString() +
        '&ski=' +
        id.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "UserNotRegistered.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return Skills.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Skills.fromJson(Map<String, dynamic> json) {
    if (json['Skills'] != null) {
      skills = new List<PlayerSkills>();
      json['Skills'].forEach((v) {
        skills.add(new PlayerSkills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.skills != null) {
      data['Skills'] = this.skills.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlayerSkills {
  String id;
  String acrobacia;
  String atletismo;
  String conArcano;
  String engano;
  String historia;
  String interpretacion;
  String intimidacion;
  String investigacion;
  String juegoManos;
  String medicina;
  String naturaleza;
  String percepcion;
  String perspicacia;
  String persuasion;
  String religion;
  String sigilo;
  String supervivencia;
  String tratoAnimales;
  /*bool profAcrobacia;
  bool profAtletismo;
  bool profConArcano;
  bool profEngano;
  bool profHistoria;
  bool profInterpretacion;
  bool profIntimidacion;
  bool profInvestigacion;
  bool profJuegoManos;
  bool profMedicina;
  bool profNaturaleza;
  bool profPercepcion;
  bool profPerspicacia;
  bool profPersuasion;
  bool profReligion;
  bool profSigilo;
  bool profSupervivencia;
  bool profTratoAnimales;*/

  PlayerSkills({
    this.id,
    this.acrobacia,
    this.atletismo,
    this.conArcano,
    this.engano,
    this.historia,
    this.interpretacion,
    this.intimidacion,
    this.investigacion,
    this.juegoManos,
    this.medicina,
    this.naturaleza,
    this.percepcion,
    this.perspicacia,
    this.persuasion,
    this.religion,
    this.sigilo,
    this.supervivencia,
    this.tratoAnimales,
    /*this.profAcrobacia,
    this.profAtletismo,
    this.profConArcano,
    this.profEngano,
    this.profHistoria,
    this.profInterpretacion,
    this.profIntimidacion,
    this.profInvestigacion,
    this.profJuegoManos,
    this.profMedicina,
    this.profNaturaleza,
    this.profPercepcion,
    this.profPerspicacia,
    this.profPersuasion,
    this.profReligion,
    this.profSigilo,
    this.profSupervivencia,
    this.profTratoAnimales,*/
  });

  PlayerSkills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acrobacia = json['Acrobacia'];
    atletismo = json['Atletismo'];
    conArcano = json['ConArcano'];
    engano = json['Engano'];
    historia = json['Historia'];
    interpretacion = json['Interpretacion'];
    intimidacion = json['Intimidacion'];
    investigacion = json['Investigacion'];
    juegoManos = json['JuegoManos'];
    medicina = json['Medicina'];
    naturaleza = json['Naturaleza'];
    percepcion = json['Percepcion'];
    perspicacia = json['Perspicacia'];
    persuasion = json['Persuasion'];
    religion = json['Religion'];
    sigilo = json['Sigilo'];
    supervivencia = json['Supervivencia'];
    tratoAnimales = json['Trato Animales'];
    /*profAcrobacia = json['profAcrobacia'].toString().toBool();
    profAtletismo = json['profAtletismo'];
    profConArcano = json['profConArcano'];
    profEngano = json['profEngano'];
    profHistoria = json['profHistoria'];
    profInterpretacion = json['profInterpretacion'];
    profIntimidacion = json['profIntimidacion'];
    profInvestigacion = json['profInvestigacion'];
    profJuegoManos = json['profJuegoManos'];
    profMedicina = json['profMedicina'];
    profNaturaleza = json['profNaturaleza'];
    profPercepcion = json['profPercepcion'];
    profPerspicacia = json['profPerspicacia'];
    profPersuasion = json['profPersuasion'];
    profReligion = json['profReligion'];
    profSigilo = json['profSigilo'];
    profSupervivencia = json['profSupervivencia'];
    profTratoAnimales = json['profTratoAnimales'];*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Acrobacia'] = this.acrobacia;
    data['Atletismo'] = this.atletismo;
    data['ConArcano'] = this.conArcano;
    data['Engano'] = this.engano;
    data['Historia'] = this.historia;
    data['Interpretacion'] = this.interpretacion;
    data['Intimidacion'] = this.intimidacion;
    data['Investigacion'] = this.investigacion;
    data['JuegoManos'] = this.juegoManos;
    data['Medicina'] = this.medicina;
    data['Naturaleza'] = this.naturaleza;
    data['Percepcion'] = this.percepcion;
    data['Perspicacia'] = this.perspicacia;
    data['Persuasion'] = this.persuasion;
    data['Religion'] = this.religion;
    data['Sigilo'] = this.sigilo;
    data['Supervivencia'] = this.supervivencia;
    data['Trato Animales'] = this.tratoAnimales;
    /*data['profAcrobacia'] = this.profAcrobacia;
    data['profAtletismo'] = this.profAtletismo;
    data['profConArcano'] = this.profConArcano;
    data['profEngano'] = this.profEngano;
    data['profHistoria'] = this.profHistoria;
    data['profInterpretacion'] = this.profInterpretacion;
    data['profIntimidacion'] = this.profIntimidacion;
    data['profInvestigacion'] = this.profInvestigacion;
    data['profJuegoManos'] = this.profJuegoManos;
    data['profMedicina'] = this.profMedicina;
    data['profNaturaleza'] = this.profNaturaleza;
    data['profPercepcion'] = this.profPercepcion;
    data['profPerspicacia'] = this.profPerspicacia;
    data['profPersuasion'] = this.profPersuasion;
    data['profReligion'] = this.profReligion;
    data['profSigilo'] = this.profSigilo;
    data['profSupervivencia'] = this.profSupervivencia;
    data['profTratoAnimales'] = this.profTratoAnimales;*/
    return data;
  }
}
