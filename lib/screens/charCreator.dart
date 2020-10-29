import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharCreator(),
    );
  }
}

class MyCharCreator extends StatefulWidget {
  @override
  _MyCharCreatorState createState() => _MyCharCreatorState();
}

class _MyCharCreatorState extends State<MyCharCreator> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(),
    );
  }
}
