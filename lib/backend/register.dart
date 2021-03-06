import 'package:http/http.dart' as http;

class Register {
  static Future<String> register(String uname, String pwd, String email) async {
    var url = 'https://api.dndmin.me/users/register/?uname=';
    var data = {
      "uname": uname,
      "pwd": pwd,
      "email": email,
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      if (response.body == "") return null;
      return response.body;
    }
    return null;
  }
}
