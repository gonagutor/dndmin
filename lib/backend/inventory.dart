import 'package:http/http.dart' as http;
import 'dart:convert';

class Inventory {
  List<Inventario> inventario;

  Inventory({this.inventario});

  static Future<Inventory> getInventory(String uToken, int id) async {
    var url = 'https://api.dndmin.me/characters/get-character-inventory/?q=' +
        id.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "UserNotRegistered.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return Inventory.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Inventory.fromJson(Map<String, dynamic> json) {
    if (json['inventario'] != null) {
      inventario = new List<Inventario>();
      json['inventario'].forEach((v) {
        inventario.add(new Inventario.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inventario != null) {
      data['inventario'] = this.inventario.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inventario {
  String id;
  String slot1;
  String slot2;
  String slot3;
  String slot4;
  String slot5;
  String slot6;
  String slot7;
  String slot8;
  String slot9;
  String slot10;
  String slot11;
  String slot12;
  String slot13;
  String slot14;
  String slot15;
  String slot16;
  String slot17;
  String slot18;
  String slot19;
  String slot20;
  String oro;
  String plata;
  String cobre;
  String proficiencias;

  Inventario(
      {this.id,
      this.slot1,
      this.slot2,
      this.slot3,
      this.slot4,
      this.slot5,
      this.slot6,
      this.slot7,
      this.slot8,
      this.slot9,
      this.slot10,
      this.slot11,
      this.slot12,
      this.slot13,
      this.slot14,
      this.slot15,
      this.slot16,
      this.slot17,
      this.slot18,
      this.slot19,
      this.slot20,
      this.oro,
      this.plata,
      this.cobre,
      this.proficiencias});

  Inventario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slot1 = json['slot1'];
    slot2 = json['slot2'];
    slot3 = json['slot3'];
    slot4 = json['slot4'];
    slot5 = json['slot5'];
    slot6 = json['slot6'];
    slot7 = json['slot7'];
    slot8 = json['slot8'];
    slot9 = json['slot9'];
    slot10 = json['slot10'];
    slot11 = json['slot11'];
    slot12 = json['slot12'];
    slot13 = json['slot13'];
    slot14 = json['slot14'];
    slot15 = json['slot15'];
    slot16 = json['slot16'];
    slot17 = json['slot17'];
    slot18 = json['slot18'];
    slot19 = json['slot19'];
    slot20 = json['slot20'];
    oro = json['Oro'];
    plata = json['Plata'];
    cobre = json['Cobre'];
    proficiencias = json['proficiencias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slot1'] = this.slot1;
    data['slot2'] = this.slot2;
    data['slot3'] = this.slot3;
    data['slot4'] = this.slot4;
    data['slot5'] = this.slot5;
    data['slot6'] = this.slot6;
    data['slot7'] = this.slot7;
    data['slot8'] = this.slot8;
    data['slot9'] = this.slot9;
    data['slot10'] = this.slot10;
    data['slot11'] = this.slot11;
    data['slot12'] = this.slot12;
    data['slot13'] = this.slot13;
    data['slot14'] = this.slot14;
    data['slot15'] = this.slot15;
    data['slot16'] = this.slot16;
    data['slot17'] = this.slot17;
    data['slot18'] = this.slot18;
    data['slot19'] = this.slot19;
    data['slot20'] = this.slot20;
    data['Oro'] = this.oro;
    data['Plata'] = this.plata;
    data['Cobre'] = this.cobre;
    data['proficiencias'] = this.proficiencias;
    return data;
  }
}
