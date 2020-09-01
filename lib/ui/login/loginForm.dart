import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'all.dart';

final uNameController = TextEditingController();
final pwdController = TextEditingController();

class LoginForm extends StatelessWidget {
  static Future<bool> login() async {
    String uInput = uNameController.text;
    String pwdInput = pwdController.text;
    Login.readName();
    return await Login.getAndSaveToken(uInput, pwdInput);
  }

  static final loginForm = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: loginForm,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Nombre de usuario',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF707070)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: TextFormField(
              controller: uNameController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Introduce Tu Nombre de usuario';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Nombre de usuario',
                filled: true,
                fillColor: const Color(0xFFEFEFEF),
                hoverColor: const Color(0xFFEFEFEF),
                focusColor: const Color(0xFFEFEFEF),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Contraseña',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF707070)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: TextFormField(
              controller: pwdController,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Introduce Tu Contraseña';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Contraseña',
                filled: true,
                fillColor: const Color(0xFFEFEFEF),
                hoverColor: const Color(0xFFEFEFEF),
                focusColor: const Color(0xFFEFEFEF),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
