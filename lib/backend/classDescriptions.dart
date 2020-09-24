import 'package:dndmin/backend/stats.dart';
import 'package:dndmin/extensions/getClassId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClassDescriptions {
  List<DescripcionesClases> descripcionesClases;

  ClassDescriptions({this.descripcionesClases});

  static Future<ClassDescriptions> getStats(String uToken, int id) async {
    Stats userStats = await Stats.getStats(uToken, id);
    int classId = userStats.getClassId();
    var url = 'https://api.dndmin.me/game/get-class-descriptions/?q=' +
        classId.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "UserNotRegistered.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return ClassDescriptions.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  ClassDescriptions.fromJson(Map<String, dynamic> json) {
    if (json['classDescriptions'] != null) {
      descripcionesClases = new List<DescripcionesClases>();
      json['classDescriptions'].forEach((v) {
        descripcionesClases.add(new DescripcionesClases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.descripcionesClases != null) {
      data['classDescriptions'] =
          this.descripcionesClases.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DescripcionesClases {
  String id;
  String clase;
  String descripcionDeClase;

  DescripcionesClases({this.id, this.clase, this.descripcionDeClase});

  DescripcionesClases.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    clase = json['Clase'];
    descripcionDeClase = json['DescripcionDeClase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Clase'] = this.clase;
    data['DescripcionDeClase'] = this.descripcionDeClase;
    return data;
  }
}
