import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/loginScreen.dart';
import 'package:dndmin/ui/login/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/mainMenu.dart';
import 'screens/charSelector.dart';

void main() async {
  runApp(Landing());
  var uname = await Login.readName();
  var authToken = await Login.readToken();
  var selectedChar = await Login.readChar();
  var selectedCharId = await Login.readCharId();
  if (!(authToken == null || authToken == "")) {
    if (selectedChar == null ||
        selectedChar == "" ||
        selectedCharId == null ||
        selectedCharId == "")
      runApp(CharSelector(
        userData: UserData(uName: uname, authToken: authToken),
      ));
    else
      runApp(MainMenu(
        userData: UserData(
          authToken: authToken,
          uName: uname,
          selectedCharName: selectedChar,
          id: int.parse(selectedCharId),
        ),
      ));
  } else {
    runApp(LoginScreen());
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("images/icon.ico"), context);
    ImageProvider logo = AssetImage("images/icon.ico");
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLanding(
        title: 'Login',
        icon: logo,
      ),
    );
  }
}

class MyLanding extends StatefulWidget {
  MyLanding({Key key, this.title, @required this.icon}) : super(key: key);
  final ImageProvider icon;
  final String title;
  @override
  _MyLandingState createState() => _MyLandingState(icon: icon);
}

class _MyLandingState extends State<MyLanding> {
  _MyLandingState({@required this.icon});
  final ImageProvider icon;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        child: Container(
          child: Image(
            image: icon,
          ),
        ),
      ),
    );
  }
}
