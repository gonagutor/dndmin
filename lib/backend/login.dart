import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Login {
  static final storage = new FlutterSecureStorage();
  static Future<String> requestToken(String uname, String pwd) async {
    var url =
        'https://api.dndmin.me/users/get-token/?uname=' + uname + '&pwd=' + pwd;
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
    await storage.write(key: 'jwt', value: token.toString());
    await storage.write(key: 'uname', value: uname.toString());
  }

  static Future<void> writeChar(String char, String charId) async {
    await storage.write(key: 'selChar', value: char.toString());
    await storage.write(key: 'charId', value: charId.toString());
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
    return await storage.read(key: 'jwt');
  }

  static Future<String> readName() async {
    return await storage.read(key: 'uname');
  }

  static Future<String> readChar() async {
    return await storage.read(key: 'selChar');
  }

  static Future<String> readCharId() async {
    return await storage.read(key: 'charId');
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: 'jwt');
  }

  static Future<void> deleteName() async {
    await storage.delete(key: 'uname');
  }

  static Future<void> deleteChar() async {
    await storage.delete(key: 'selChar');
  }

  static Future<void> deleteCharId() async {
    await storage.delete(key: 'charId');
  }

  static Future<void> logout() async {
    deleteToken();
    deleteChar();
    deleteCharId();
    deleteName();
  }
}
