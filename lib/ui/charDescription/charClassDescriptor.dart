import 'package:dndmin/ui/customLoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:dndmin/backend/classDescriptions.dart';
import 'package:dndmin/config/palette.dart';
import 'package:dndmin/backend/userData.dart';

DescripcionesClases descripcionesClases = DescripcionesClases(id: '0');

class CharClassDescriptor extends StatelessWidget {
  const CharClassDescriptor({
    Key key,
    @required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ClassDescriptions.getStats(userData.authToken, userData.id),
      builder:
          (BuildContext context, AsyncSnapshot<ClassDescriptions> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Icon(Icons.error);
          descripcionesClases = snapshot.data.descripcionesClases[0];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  '¿Que es un ' + descripcionesClases.clase + '?',
                  style: TextStyle(
                    color: Palette.fontColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                descripcionesClases.descripcionDeClase
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', '')
                    .replaceAll('  ', '')
                    .replaceAll('\r', '')
                    .replaceAll('\n', ''),
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          );
        } else {
          if (descripcionesClases.id == '0') {
            return CustomLoadingIndicator();
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  '¿Que es un ' + descripcionesClases.clase + '?',
                  style: TextStyle(
                    color: Palette.fontColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                descripcionesClases.descripcionDeClase
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', '')
                    .replaceAll('  ', '')
                    .replaceAll('\r', '')
                    .replaceAll('\n', ''),
                style: TextStyle(
                  color: Palette.fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          );
        }
      },
    );
  }
}
