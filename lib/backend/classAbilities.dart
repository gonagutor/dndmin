import 'dart:convert';
import 'package:http/http.dart' as http;

class ClassAbilities {
  List<ClassAbility> habilidadesDeClase;

  ClassAbilities({this.habilidadesDeClase});

  static Future<ClassAbilities> getClassAbilities(int id) async {
    var url = 'https://api.dndmin.me/game/get-class-habilities/?playerID=' +
        id.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return ClassAbilities.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  ClassAbilities.fromJson(Map<String, dynamic> json) {
    if (json['habilidadesDeClase'] != null) {
      habilidadesDeClase = new List<ClassAbility>();
      json['habilidadesDeClase'].forEach((v) {
        habilidadesDeClase.add(new ClassAbility.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.habilidadesDeClase != null) {
      data['habilidadesDeClase'] =
          this.habilidadesDeClase.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassAbility {
  String habilityID;
  String habilityClass;
  String habilityName;
  String habilityDescription;

  ClassAbility(
      {this.habilityID,
      this.habilityClass,
      this.habilityName,
      this.habilityDescription});

  ClassAbility.fromJson(Map<String, dynamic> json) {
    habilityID = json['habilityID'];
    habilityClass = json['habilityClass'];
    habilityName = json['habilityName'];
    habilityDescription = json['habilityDescription']
        .toString()
        .replaceAll('<p>', '')
        .replaceAll('</p>', '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['habilityID'] = this.habilityID;
    data['habilityClass'] = this.habilityClass;
    data['habilityName'] = this.habilityName;
    data['habilityDescription'] = this.habilityDescription;
    return data;
  }
}
