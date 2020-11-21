import 'package:dndmin/config/palette.dart';
import 'package:dndmin/screens/loginScreen.dart';
import 'package:dndmin/ui/register/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyRegisterScreen(title: 'Iniciar Sesión'),
    );
  }
}

class MyRegisterScreen extends StatefulWidget {
  MyRegisterScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyRegisterScreenState createState() => _MyRegisterScreenState();
}

class _MyRegisterScreenState extends State<MyRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFF64E0),
              const Color(0xFF46DAFF),
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: Palette.standartShadow,
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 0),
                              child: Text(
                                'Registrarse',
                                style: TextStyle(
                                  fontSize: 44,
                                  color: Palette.fontColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Divider(
                                height: 2,
                                thickness: 1.5,
                              ),
                            ),
                            RegisterForm(),
                            RegisterButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 35,
              left: 10,
              child: GoBackButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: ButtonTheme(
        height: 65,
        minWidth: 300,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: <Color>[
                Color(0xFF86B1F4),
                Color(0xFF79B9F6),
              ],
            ),
          ),
          child: FlatButton(
            onPressed: () async {
              if (RegisterForm.registerForm.currentState.validate()) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => AlertDialog(
                    title:
                        Text('Registrandose...', textAlign: TextAlign.center),
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
                String keep = await RegisterForm.register();
                Navigator.of(context).pop();
                if (keep == null ||
                    keep == "ConError." ||
                    keep == "UserError." ||
                    keep == "MailError." ||
                    keep == "WrongRequest.") {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Oops... '),
                      content: Text((keep == "ConError.")
                          ? "El servidor está teniendo problemas, intentalo mas tarde"
                          : (keep == "UserError.")
                              ? "Este usuario ya está registrado, prueba con otro"
                              : (keep == "MailError.")
                                  ? "Ya se está usando este correo"
                                  : "Se ha producido un problema desconocido"),
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
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('¡Todo Correcto!'),
                      content: Text(
                          'Revisa tu correo para activar la cuenta o diselo a Gonzalo'),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            runApp(LoginScreen());
                          },
                          child: Text("Okay"),
                        ),
                      ],
                    ),
                  );
                }
              }
            },
            color: const Color(0x0091AAF3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
            child: RichText(
              text: TextSpan(
                text: 'Registrarse',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: Container(
        width: 130,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: Palette.standartShadow,
          borderRadius: BorderRadius.circular(90),
        ),
        child: FlatButton(
          onPressed: () => runApp(LoginScreen()),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90),
          ),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Palette.fontColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  width: 65,
                  child: Text(
                    'Volver',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Palette.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
