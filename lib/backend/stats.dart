import 'dart:convert';
import 'package:http/http.dart' as http;

class Stats {
  List<PlayerStats> stats;

  Stats({this.stats});

  static Future<Stats> getStats(String uToken, int id) async {
    var url = 'https://api.dndmin.me/characters/get-character-stats/?q=' +
        id.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "UserNotRegistered.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return Stats.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Stats.fromJson(Map<String, dynamic> json) {
    if (json['stats'] != null) {
      stats = new List<PlayerStats>();
      json['stats'].forEach((v) {
        stats.add(new PlayerStats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stats != null) {
      data['stats'] = this.stats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlayerStats {
  String id;
  String nombre;
  String raza;
  String subNombre;
  String dueno;
  String clase;
  String nivel;
  String px;
  String pxActuales;
  String iniciativa;
  String velocidad;
  String ca;
  String pv;
  String pvActuales;
  String fuerza;
  String destreza;
  String constitucion;
  String inteligencia;
  String sabiduria;
  String carisma;
  /*bool profFuerza;
  bool profDestreza;
  bool profConstitucion;
  bool profInteligencia;
  bool profSabiduria;
  bool profCarisma;*/
  int profBonus;

  PlayerStats(
      {this.id,
      this.nombre,
      this.raza,
      this.subNombre,
      this.dueno,
      this.clase,
      this.nivel,
      this.px,
      this.pxActuales,
      this.iniciativa,
      this.velocidad,
      this.ca,
      this.pv,
      this.pvActuales,
      this.fuerza,
      this.destreza,
      this.constitucion,
      this.inteligencia,
      this.sabiduria,
      this.carisma,
      /*this.profFuerza,
      this.profDestreza,
      this.profConstitucion,
      this.profInteligencia,
      this.profSabiduria,
      this.profCarisma,*/
      this.profBonus});

  PlayerStats.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    nombre = json['Nombre'];
    raza = json['Raza'];
    subNombre = json['subNombre'];
    dueno = json['Dueno'];
    clase = json['Clase'];
    nivel = json['Nivel'];
    px = json['PX'];
    pxActuales = json['PXActuales'];
    iniciativa = json['Iniciativa'];
    velocidad = json['Velocidad'];
    ca = json['CA'];
    pv = json['PV'];
    pvActuales = json['PVActuales'];
    fuerza = json['Fuerza'];
    destreza = json['Destreza'];
    constitucion = json['Constitucion'];
    inteligencia = json['Inteligencia'];
    sabiduria = json['Sabiduria'];
    carisma = json['Carisma'];
    /*profFuerza = json['profFuerza'];
    profDestreza = json['profDestreza'];
    profConstitucion = json['profConstitucion'];
    profInteligencia = json['profInteligencia'];
    profSabiduria = json['profSabiduria'];
    profCarisma = json['profCarisma'];*/
    profBonus = ((int.parse(json['Nivel']) / 4) + 1).ceil();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Nombre'] = this.nombre;
    data['Raza'] = this.raza;
    data['subNombre'] = this.subNombre;
    data['Dueno'] = this.dueno;
    data['Clase'] = this.clase;
    data['Nivel'] = this.nivel;
    data['PX'] = this.px;
    data['PXActuales'] = this.pxActuales;
    data['Iniciativa'] = this.iniciativa;
    data['Velocidad'] = this.velocidad;
    data['CA'] = this.ca;
    data['PV'] = this.pv;
    data['PVActuales'] = this.pvActuales;
    data['Fuerza'] = this.fuerza;
    data['Destreza'] = this.destreza;
    data['Constitucion'] = this.constitucion;
    data['Inteligencia'] = this.inteligencia;
    data['Sabiduria'] = this.sabiduria;
    data['Carisma'] = this.carisma;
    /*data['profFuerza'] = this.profFuerza;
    data['profDestreza'] = this.profDestreza;
    data['profConstitucion'] = this.profConstitucion;
    data['profInteligencia'] = this.profInteligencia;
    data['profSabiduria'] = this.profSabiduria;
    data['profCarisma'] = this.profCarisma;*/
    return data;
  }
}
