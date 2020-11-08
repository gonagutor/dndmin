import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

class Login {
  static final storage = new FlutterSecureStorage();
  static Future<String> requestToken(String uname, String pwd) async {
    var url = "https://api.dndmin.me/users/get-token/";
    var body = {
      "uname": uname,
      "pwd": pwd,
    };
    var response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      if (response.body == "UserNotRegistered.") return null;
      if (response.body == "ConError.") return null;
      if (response.body == "") return null;
      return response.body;
    }
    return null;
  }

  static Future<void> secureWrite(String token, String uname) async {
    if (!kIsWeb) {
      await storage.write(key: 'jwt', value: token.toString());
      await storage.write(key: 'uname', value: uname.toString());
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('jwt', token.toString());
      prefs.setString('uname', uname.toString());
    }
  }

  static Future<void> writeChar(String char, String charId) async {
    if (!kIsWeb) {
      await storage.write(key: 'selChar', value: char.toString());
      await storage.write(key: 'charId', value: charId.toString());
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('selChar', char.toString());
      prefs.setString('charId', charId.toString());
    }
  }

  static Future<bool> getAndSaveToken(String uname, String pwd) async {
    var toWrite = await requestToken(uname, pwd);
    if (toWrite != null) {
      secureWrite(toWrite, uname);
      return true;
    }
    return false;
  }

  static Future<String> readToken() async {
    if (!kIsWeb) {
      return await storage.read(key: 'jwt');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('jwt');
    }
  }

  static Future<String> readName() async {
    if (!kIsWeb) {
      return await storage.read(key: 'uname');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('uname');
    }
  }

  static Future<String> readChar() async {
    if (!kIsWeb) {
      return await storage.read(key: 'selChar');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('selChar');
    }
  }

  static Future<String> readCharId() async {
    if (!kIsWeb) {
      return await storage.read(key: 'charId');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('charId');
    }
  }

  static Future<void> deleteToken() async {
    if (!kIsWeb) {
      await storage.delete(key: 'jwt');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('jwt');
    }
  }

  static Future<void> deleteName() async {
    if (!kIsWeb) {
      await storage.delete(key: 'uname');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('uname');
    }
  }

  static Future<void> deleteChar() async {
    if (!kIsWeb) {
      await storage.delete(key: 'selChar');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('selChar');
    }
  }

  static Future<void> deleteCharId() async {
    if (!kIsWeb) {
      await storage.delete(key: 'charId');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('charId');
    }
  }

  static Future<void> logout() async {
    deleteToken();
    deleteChar();
    deleteCharId();
    deleteName();
  }
}
