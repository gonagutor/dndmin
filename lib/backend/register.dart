import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Register {
  static final storage = new FlutterSecureStorage();
  static String hashedPwd(String input) {
    String toHash = 't1HsN0tV3rygud' + input;
    return sha512.convert(utf8.encode(toHash)).toString();
  }

  static Future<String> register(String uname, String pwd, String email) async {
    var url = 'https://api.dndmin.me/users/register/?uname=' +
        uname +
        '&pwd=' +
        hashedPwd(pwd) +
        '&email=' +
        email;
    var response = await http.post(url);
    if (response.statusCode == 200) {
      if (response.body == "") return null;
      return response.body;
    }
    return null;
  }
}
