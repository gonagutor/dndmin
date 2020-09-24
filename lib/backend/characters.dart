import 'dart:convert';
import 'package:http/http.dart' as http;

class CharactersList {
  List<Personaje> personajes;

  CharactersList({this.personajes});

  static Future<CharactersList> getUserCharList(String uToken) async {
    var url = 'https://api.dndmin.me/users/get-user-characters/?token=' +
        uToken.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "ExpiredToken.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "NoCharactersRegistered.") {
        List<Personaje> returnable = [
          Personaje(nombre: "NoCharactersRegistered.")
        ];
        return CharactersList(personajes: returnable);
      } else if (response.body == "") return null;
      return CharactersList.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  CharactersList.fromJson(Map<String, dynamic> json) {
    if (json['personajes'] != null) {
      personajes = new List<Personaje>();
      json['personajes'].forEach((v) {
        personajes.add(new Personaje.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personajes != null) {
      data['personajes'] = this.personajes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Personaje {
  String id;
  String nombre;
  String raza;
  String subNombre;
  String dueno;
  String clase;
  String nivel;
  String pxTotales;
  String pxActuales;

  Personaje(
      {this.id,
      this.nombre,
      this.raza,
      this.subNombre,
      this.dueno,
      this.clase,
      this.nivel,
      this.pxTotales,
      this.pxActuales});

  Personaje.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    raza = json['raza'];
    subNombre = json['subNombre'];
    dueno = json['dueno'];
    clase = json['clase'];
    nivel = json['nivel'];
    pxTotales = json['pxTotales'];
    pxActuales = json['pxActuales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['nombre'] = this.nombre;
    data['raza'] = this.raza;
    data['subNombre'] = this.subNombre;
    data['dueno'] = this.dueno;
    data['clase'] = this.clase;
    data['nivel'] = this.nivel;
    data['pxTotales'] = this.pxTotales;
    data['pxActuales'] = this.pxActuales;
    return data;
  }
}
