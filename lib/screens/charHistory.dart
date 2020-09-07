import 'package:dndmin/backend/charStories.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Historia historia = Historia(id: '0');

class CharHistory extends StatelessWidget {
  final UserData userData;
  CharHistory({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharHistory(
        title: 'Descripción de tu personaje',
        userData: userData,
      ),
    );
  }
}

class MyCharHistory extends StatefulWidget {
  MyCharHistory({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyCharHistoryState createState() => _MyCharHistoryState(userData: userData);
}

class _MyCharHistoryState extends State<MyCharHistory> {
  final UserData userData;
  _MyCharHistoryState({@required this.userData});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Palette.topGradient, Palette.bottomGradient],
            stops: [0.0, 1.0],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height - 120,
              child: TopBar(
                userData: userData,
              ),
            ),
            Positioned(
              top: 120,
              bottom: 90,
              right: 17.5,
              left: 17.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 17.5 * 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        boxShadow: Palette.standartShadow,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  'Tu Historia',
                                  style: TextStyle(
                                    color: Palette.fontColor,
                                    fontSize: 38.24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Divider(height: 0, thickness: 3),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: FutureBuilder(
                                  future: CharStories.getStory(
                                      userData.authToken, userData.id),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<CharStories> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.hasError)
                                        return Icon(Icons.error);
                                      historia = snapshot.data.historias[0];
                                      return Text(
                                        historia.historia,
                                        style: TextStyle(
                                          color: Palette.fontColor,
                                          fontSize: 16,
                                        ),
                                      );
                                    } else {
                                      if (historia.id == '0') {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              300,
                                          child: Stack(
                                            children: <Widget>[
                                              Center(
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  'Cargando...',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return Text(
                                        historia.historia,
                                        style: TextStyle(
                                          color: Palette.fontColor,
                                          fontSize: 16,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedBottomBar(
              userData: userData,
              buttonState: [false, false, false, false, true],
            ),
          ],
        ),
      ),
    );
  }
}
