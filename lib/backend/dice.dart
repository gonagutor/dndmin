import 'package:http/http.dart' as http;
import 'dart:convert';

class Throws {
  List<Dados> dados;
  Throws({this.dados});

  static Future<Throws> getThrows(String uToken) async {
    // TODO: URL DE PRUEBA CAMBIAR
    var url = 'http://dndgonzalo.ddns.net/api-call.php?token=' +
        uToken.toString() +
        '&dados=1';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "UserNotRegistered.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return Throws.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Throws.fromJson(Map<String, dynamic> json) {
    if (json['Dados'] != null) {
      dados = new List<Dados>();
      json['Dados'].forEach((v) {
        dados.add(new Dados.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dados != null) {
      data['Dados'] = this.dados.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dados {
  String id;
  String nombre;
  String tipoDado;
  String tiradaDado;

  Dados({this.id, this.nombre, this.tipoDado, this.tiradaDado});

  Dados.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    tipoDado = json['tipoDado'];
    tiradaDado = json['tiradaDado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['tipoDado'] = this.tipoDado;
    data['tiradaDado'] = this.tiradaDado;
    return data;
  }
}
