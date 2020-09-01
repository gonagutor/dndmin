import 'package:dndmin/backend/notifications.dart';
import 'package:dndmin/backend/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Notifications lastCheck;

class EventList extends StatefulWidget {
  EventList({Key key, this.title, @required this.userData}) : super(key: key);
  final String title;
  final UserData userData;
  @override
  _EventListState createState() => _EventListState(userData: userData);
}

class _EventListState extends State<EventList> {
  _EventListState({@required this.userData});
  final UserData userData;
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      if (this.mounted) setState(() {});
    });
    Future<Notifications> _notifications = Future<Notifications>(
        () => Notifications.getNotifications(userData.authToken));
    return Container(
      constraints: BoxConstraints(minHeight: 75),
      width: MediaQuery.of(context).size.width - 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, -0.5), //(x,y)
            spreadRadius: 0.6,
            blurRadius: 6,
          ),
        ],
      ),
      child: FutureBuilder(
        future: _notifications,
        builder: (BuildContext context, AsyncSnapshot<Notifications> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) return Icon(Icons.error);
            lastCheck = snapshot.data;
            if (lastCheck == null) print('hola');
            return NotificationCard(notificationList: lastCheck);
          } else {
            if (lastCheck == null)
              return Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator()),
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
              );
            return NotificationCard(notificationList: lastCheck);
          }
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final Notifications notificationList;
  NotificationCard({@required this.notificationList});
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.only(right: 18),
        child: Stack(
          children: [
            Positioned(
              left: 23,
              top: 0,
              bottom: 0,
              width: 1,
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Scrollbar(
              child: ListView.builder(
                itemCount:
                    notificationList.notificaciones.length, //called On Null
                itemBuilder: (context, index) {
                  final Notificacion actualNot =
                      notificationList.notificaciones[
                          notificationList.notificaciones.length - index - 1];
                  Color circleColor = Colors.greenAccent;
                  switch (notificationList
                      .notificaciones[
                          notificationList.notificaciones.length - index - 1]
                      .importance) {
                    case "0":
                      circleColor = Colors.greenAccent;
                      break;
                    case "1":
                      circleColor = Colors.yellow;
                      break;
                    case "2":
                      circleColor = Colors.orangeAccent;
                      break;
                    case "3":
                      circleColor = Colors.redAccent;
                      break;
                  }
                  return Container(
                    height: 75,
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Stack(
                      children: [
                        Positioned(
                          width: 31,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.circle,
                              color: circleColor,
                              size: 20,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 35,
                          top: 0,
                          bottom: 0,
                          right: 18,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  text: actualNot.text,
                                ),
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  text: actualNot.helperText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
