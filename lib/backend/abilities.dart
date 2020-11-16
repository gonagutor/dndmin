import 'package:http/http.dart' as http;
import 'dart:convert';

class RaceAbilities {
  List<MainAbilities> mainAbilities;
  List<SubRaceAbilities> subRaceAbilities;

  RaceAbilities({this.mainAbilities, this.subRaceAbilities});

  static Future<RaceAbilities> getRaceAbilities(int id) async {
    var url = 'https://api.dndmin.me/game/get-race-abilities/?playerID=' +
        id.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return RaceAbilities.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  RaceAbilities.fromJson(Map<String, dynamic> json) {
    if (json['MainAbilities'] != null) {
      mainAbilities = new List<MainAbilities>();
      json['MainAbilities'].forEach((v) {
        mainAbilities.add(new MainAbilities.fromJson(v));
      });
    }
    if (json['SubRaceAbilities'] != null) {
      subRaceAbilities = new List<SubRaceAbilities>();
      json['SubRaceAbilities'].forEach((v) {
        subRaceAbilities.add(new SubRaceAbilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainAbilities != null) {
      data['MainAbilities'] =
          this.mainAbilities.map((v) => v.toJson()).toList();
    }
    if (this.subRaceAbilities != null) {
      data['SubRaceAbilities'] =
          this.subRaceAbilities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainAbilities {
  String id;
  String ownerRace;
  String name;
  String description;

  MainAbilities({this.id, this.ownerRace, this.name, this.description});

  MainAbilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerRace = json['ownerRace'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ownerRace'] = this.ownerRace;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class SubRaceAbilities {
  String id;
  String ownerRace;
  String name;
  String description;

  SubRaceAbilities({this.id, this.ownerRace, this.name, this.description});

  SubRaceAbilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerRace = json['ownerRace'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ownerRace'] = this.ownerRace;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
