import 'package:http/http.dart' as http;
import 'dart:convert';

class CharStories {
  List<Historia> historias;

  CharStories({this.historias});

  static Future<CharStories> getStory(String uToken, int id) async {
    var url = 'https://api.dndmin.me/characters/get-character-stories/?q=' +
        id.toString();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "ExpiredToken.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
      return CharStories.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  CharStories.fromJson(Map<String, dynamic> json) {
    if (json['stories'] != null) {
      historias = new List<Historia>();
      json['stories'].forEach((v) {
        historias.add(new Historia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.historias != null) {
      data['stories'] = this.historias.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Historia {
  String id;
  String historia;

  Historia({this.id, this.historia});

  Historia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    historia = json['historia']
        .toString()
        .replaceAll('  ', '')
        .replaceAll('<p>', '')
        .replaceAll('\n', '')
        .replaceAll('\r', '')
        .replaceAll('. ', '.')
        .replaceAll('.', '. ')
        .replaceAll('</p>', '\n\n');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['historia'] = this.historia;
    return data;
  }
}
