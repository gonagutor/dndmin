import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Login {
  static final storage = new FlutterSecureStorage();
  static String hashedPwd(String input) {
    String toHash = 't1HsN0tV3rygud' + input;
    return sha512.convert(utf8.encode(toHash)).toString();
  }

  static Future<String> requestToken(String uname, String pwd) async {
    // TODO: URL DE PRUEBA CAMBIAR
    var url = 'https://dndgonzalo.herokuapp.com/get-token.php?uname=' +
        uname +
        '&pwd=' +
        hashedPwd(pwd);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body == "UserNotRegistered.")
        return null;
      else if (response.body == "ConError.")
        return null;
      else if (response.body == "") return null;
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
}
