import 'package:dndmin/backend/classDescriptions.dart';
import 'package:dndmin/backend/descriptions.dart';
import 'package:dndmin/ui/charDescription/charClassDescriptor.dart';
import 'package:flutter/material.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:dndmin/ui/animatedWidgets/animatedBottomBar.dart';
import 'package:dndmin/ui/mainMenu/all.dart';
import 'package:flutter/services.dart';

DescripcionesClases descripcionesClases = DescripcionesClases(id: '0');
Descripciones descripciones = Descripciones(id: '0');

class CharDescription extends StatelessWidget {
  final UserData userData;
  CharDescription({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnDmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCharDescription(
        title: 'Descripción de tu personaje',
        userData: userData,
      ),
    );
  }
}

class MyCharDescription extends StatefulWidget {
  MyCharDescription({Key key, this.title, @required this.userData})
      : super(key: key);
  final String title;
  final UserData userData;
  @override
  _MyCharDescriptionState createState() =>
      _MyCharDescriptionState(userData: userData);
}

class _MyCharDescriptionState extends State<MyCharDescription> {
  final UserData userData;
  _MyCharDescriptionState({@required this.userData});
  List<int> activeView = [0, 0];
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Caracteristicas',
                                  style: TextStyle(
                                    color: Palette.fontColor,
                                    fontSize: 38.24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Divider(height: 0, thickness: 3),
                              CharClassDescriptor(userData: userData),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Apariencia y personalidad',
                                  style: TextStyle(
                                    color: Palette.fontColor,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 50,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  75) /
                                              2,
                                      color: (activeView[0] == 0)
                                          ? Palette.secondaryColor
                                          : Colors.white,
                                      child: Center(
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              activeView[0] = 0;
                                            });
                                          },
                                          child: Center(
                                              child: Text('Personalidad')),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  75) /
                                              2,
                                      color: (activeView[0] == 0)
                                          ? Colors.white
                                          : Palette.secondaryColor,
                                      child: Center(
                                        child: FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                activeView[0] = 1;
                                              });
                                            },
                                            child: Center(
                                                child: Text('Apariencia'))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FutureBuilder(
                                future: CharDescriptions.getDescription(
                                    userData.authToken, userData.id),
                                builder: (BuildContext context,
                                    AsyncSnapshot<CharDescriptions> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasError)
                                      return Icon(Icons.error);
                                    descripciones =
                                        snapshot.data.descripciones[0];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AnimatedCrossFade(
                                        firstChild: Center(
                                          child: Text(
                                            descripciones.personalidad,
                                            style: TextStyle(
                                              color: Palette.fontColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        secondChild: Center(
                                          child: Text(
                                            descripciones.apariencia,
                                            style: TextStyle(
                                              color: Palette.fontColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        crossFadeState: (activeView[0] == 0)
                                            ? CrossFadeState.showFirst
                                            : CrossFadeState.showSecond,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    );
                                  } else {
                                    if (descripciones.id == '0') {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height -
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
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AnimatedCrossFade(
                                        firstChild: Center(
                                          child: Text(
                                            descripciones.personalidad,
                                            style: TextStyle(
                                              color: Palette.fontColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        secondChild: Center(
                                          child: Text(
                                            descripciones.apariencia,
                                            style: TextStyle(
                                              color: Palette.fontColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        crossFadeState: (activeView[0] == 0)
                                            ? CrossFadeState.showFirst
                                            : CrossFadeState.showSecond,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    );
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Mentalidad',
                                  style: TextStyle(
                                    color: Palette.fontColor,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 50,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  75) /
                                              3,
                                      color: (activeView[1] == 0)
                                          ? Palette.secondaryColor
                                          : Colors.white,
                                      child: Center(
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              activeView[1] = 0;
                                            });
                                          },
                                          child:
                                              Center(child: Text('Motivación')),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  75) /
                                              3,
                                      color: (activeView[1] == 1)
                                          ? Palette.secondaryColor
                                          : Colors.white,
                                      child: Center(
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              activeView[1] = 1;
                                            });
                                          },
                                          child: Center(child: Text('Ideales')),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  75) /
                                              3,
                                      color: (activeView[1] == 2)
                                          ? Palette.secondaryColor
                                          : Colors.white,
                                      child: Center(
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              activeView[1] = 2;
                                            });
                                          },
                                          child:
                                              Center(child: Text('Defectos')),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FutureBuilder(
                                future: CharDescriptions.getDescription(
                                    userData.authToken, userData.id),
                                builder: (BuildContext context,
                                    AsyncSnapshot<CharDescriptions> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasError)
                                      return Icon(Icons.error);
                                    descripciones =
                                        snapshot.data.descripciones[0];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AnimatedCrossFade(
                                        firstChild: Center(
                                          child: Text(
                                            descripciones.motivaciones,
                                            style: TextStyle(
                                              color: Palette.fontColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        secondChild: (activeView[1] == 2)
                                            ? Center(
                                                child: Text(
                                                  descripciones.ideales,
                                                  style: TextStyle(
                                                    color: Palette.fontColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            : Center(
                                                child: Text(
                                                  descripciones.defectos,
                                                  style: TextStyle(
                                                    color: Palette.fontColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                        crossFadeState: (activeView[1] == 0)
                                            ? CrossFadeState.showFirst
                                            : CrossFadeState.showSecond,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    );
                                  } else {
                                    if (descripciones.id == '0') {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height -
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
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AnimatedCrossFade(
                                        firstChild: Center(
                                          child: Text(
                                            descripciones.motivaciones,
                                            style: TextStyle(
                                              color: Palette.fontColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        secondChild: (activeView[1] == 2)
                                            ? Center(
                                                child: Text(
                                                  descripciones.ideales,
                                                  style: TextStyle(
                                                    color: Palette.fontColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            : Center(
                                                child: Text(
                                                  descripciones.defectos,
                                                  style: TextStyle(
                                                    color: Palette.fontColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                        crossFadeState: (activeView[1] == 0)
                                            ? CrossFadeState.showFirst
                                            : CrossFadeState.showSecond,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    );
                                  }
                                },
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
              buttonState: [true, false, false, false, false],
            ),
          ],
        ),
      ),
    );
  }
}
