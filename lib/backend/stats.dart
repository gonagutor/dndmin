import 'dart:convert';
import 'package:http/http.dart' as http;

class Stats {
  List<PlayerStats> stats;

  Stats({this.stats});

  static Future<Stats> getStats(String uToken, int id /*Remuv*/) async {
    var url = 'http://dndgonzalo.ddns.net/api-call.php?token=' +
        uToken.toString() +
        '&sta=' +
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
    if (json['Stats'] != null) {
      stats = new List<PlayerStats>();
      json['Stats'].forEach((v) {
        stats.add(new PlayerStats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stats != null) {
      data['Stats'] = this.stats.map((v) => v.toJson()).toList();
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
      this.carisma});

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
    return data;
  }
}
