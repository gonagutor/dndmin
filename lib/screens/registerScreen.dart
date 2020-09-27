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
            onPressed: () {},
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

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            //controller: uNameController,
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
            'Correo',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF707070)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10),
          child: TextFormField(
            //controller: pwdController,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Introduce Tu Correo';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Correo',
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
            //controller: pwdController,
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
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Repite tu Contraseña',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF707070)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10),
          child: TextFormField(
            //controller: pwdController,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Introduce Tu Contraseña';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Repite tu Contraseña',
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
