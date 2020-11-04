import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/screens/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThrowListScreen extends StatelessWidget {
  final UserData userData;
  ThrowListScreen({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyThrowListScreen(
        title: 'Menú Principal',
        userData: userData,
      ),
    );
  }
}

class MyThrowListScreen extends StatefulWidget {
  MyThrowListScreen({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyThrowListScreenState createState() =>
      _MyThrowListScreenState(userData: userData);
}

class _MyThrowListScreenState extends State<MyThrowListScreen> {
  final UserData userData;
  _MyThrowListScreenState({@required this.userData});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Container(
      child: GestureDetector(
        onLongPress: () => runApp(MainMenu(userData: userData)),
      ),
    );
  }
}
