import 'package:dndmin/backend/inventory.dart';
import 'package:dndmin/fonts/rpgAwesomeIcons.dart';
import 'package:flutter/material.dart';

class CoinIndicator extends StatelessWidget {
  const CoinIndicator({@required this.playerInventory});
  final Inventario playerInventory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 100) / 3,
            height: ((MediaQuery.of(context).size.width - 100) / 3) / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    RPGAwesome.ball,
                    color: Colors.yellow[800],
                  ),
                ),
                Text('MO: ' + playerInventory.oro),
              ],
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 100) / 3,
            height: ((MediaQuery.of(context).size.width - 100) / 3) / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    RPGAwesome.ball,
                    color: Colors.grey,
                  ),
                ),
                Text('MP: ' + playerInventory.plata),
              ],
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 100) / 3,
            height: ((MediaQuery.of(context).size.width - 100) / 3) / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    RPGAwesome.ball,
                    color: Color(0xFFb87333),
                  ),
                ),
                Text('MC: ' + playerInventory.cobre),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
