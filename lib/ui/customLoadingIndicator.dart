import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
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
}
