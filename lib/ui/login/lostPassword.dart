import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LostPassword extends StatelessWidget {
  _recovery() {
    print('hola');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: RichText(
        text: TextSpan(
          text: '¿Has olvidado tu\ncontraseña? ',
          style: TextStyle(color: const Color(0xFF707070), fontSize: 13),
          children: <TextSpan>[
            TextSpan(
              text: 'Click Aquí.',
              style: TextStyle(color: const Color(0xFF466BFF), fontSize: 13),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _recovery();
                },
            ),
          ],
        ),
      ),
    );
  }
}
