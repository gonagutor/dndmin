import 'package:http/http.dart' as http;
import 'dart:convert';

class CharDescriptions {
  List<Descripciones> descripciones;

  CharDescriptions({this.descripciones});

  static Future<CharDescriptions> getDescription(String uToken, int id) async {
    var url = 'https://api.dndmin.me/characters/get-character-description/?q=' +
        id.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "UserNotRegistered.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return CharDescriptions.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  CharDescriptions.fromJson(Map<String, dynamic> json) {
    if (json['description'] != null) {
      descripciones = new List<Descripciones>();
      json['description'].forEach((v) {
        descripciones.add(new Descripciones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.descripciones != null) {
      data['description'] = this.descripciones.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Descripciones {
  String id;
  String personalidad;
  String apariencia;
  String motivaciones;
  String ideales;
  String defectos;

  Descripciones(
      {this.id,
      this.personalidad,
      this.apariencia,
      this.motivaciones,
      this.ideales,
      this.defectos});

  Descripciones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personalidad = json['Personalidad']
        .toString()
        .replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('  ', '')
        .replaceAll('\r', '')
        .replaceAll('\n', '')
        .replaceAll('. ', '.')
        .replaceAll('.', '. ');
    apariencia = json['Apariencia']
        .toString()
        .replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('  ', '')
        .replaceAll('\r', '')
        .replaceAll('\n', '')
        .replaceAll('. ', '.')
        .replaceAll('.', '. ');
    motivaciones = json['Motivaciones']
        .toString()
        .replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('  ', '')
        .replaceAll('\r', '')
        .replaceAll('\n', '')
        .replaceAll('. ', '.')
        .replaceAll('.', '. ');
    ideales = json['Ideales']
        .toString()
        .replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('  ', '')
        .replaceAll('\r', '')
        .replaceAll('\n', '')
        .replaceAll('. ', '.')
        .replaceAll('.', '. ');
    defectos = json['Defectos']
        .toString()
        .replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('  ', '')
        .replaceAll('\r', '')
        .replaceAll('\n', '')
        .replaceAll('. ', '.')
        .replaceAll('.', '. ');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Personalidad'] = this.personalidad;
    data['Apariencia'] = this.apariencia;
    data['Motivaciones'] = this.motivaciones;
    data['Ideales'] = this.ideales;
    data['Defectos'] = this.defectos;
    return data;
  }
}
