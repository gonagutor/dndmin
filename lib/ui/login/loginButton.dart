import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/charSelector.dart';
import 'package:dndmin/screens/mainMenu.dart';
import 'package:dndmin/ui/login/all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26, top: 10, bottom: 10),
      child: ButtonTheme(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: <Color>[
                Color(0xFF95A8F2),
                Color(0xFF8EACF3),
              ],
            ),
          ),
          child: FlatButton(
            color: const Color(0xFF91AAF3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
            onPressed: () async {
              if (LoginForm.loginForm.currentState.validate()) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => AlertDialog(
                    title:
                        Text('Iniciando Sesión', textAlign: TextAlign.center),
                    content: Container(
                      height: 100,
                      width: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                );
                bool keep = await LoginForm.login();
                Navigator.of(context).pop();
                if (!keep) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Oops... '),
                      content:
                          Text('Te has equivocado en contraseña o usuario'),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Okay"),
                        ),
                      ],
                    ),
                  );
                } else {
                  String token = await Login.readToken();
                  String uname = await Login.readName();
                  String charName = await Login.readChar();
                  if (!(charName == null)) {
                    runApp(
                      MainMenu(
                        userData: UserData(
                          authToken: token,
                          uName: uname,
                          selectedCharName: charName,
                        ),
                      ),
                    );
                  } else {
                    runApp(
                      CharSelector(
                        userData: UserData(
                          uName: uname,
                          authToken: token,
                        ),
                      ),
                    );
                  }
                }
              }
            },
            child: RichText(
              text: TextSpan(
                text: 'Iniciar Sesión',
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
