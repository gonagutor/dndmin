import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SlotsRow extends StatelessWidget {
  SlotsRow(
      {@required this.slotOne,
      @required this.slotTwo,
      this.slotTextOne,
      this.slotTextTwo});
  final int slotOne;
  final int slotTwo;
  final String slotTextOne;
  final String slotTextTwo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                child: Text(
                  'Slot ' + slotOne.toString() + ': ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Palette.fontColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  height: 50,
                  width: (MediaQuery.of(context).size.width - 75) / 2 - 10,
                  decoration: BoxDecoration(
                    color: Palette.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: Text(slotTextOne),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                child: Text(
                  'Slot ' + slotTwo.toString() + ': ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Palette.fontColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  height: 50,
                  width: (MediaQuery.of(context).size.width - 75) / 2 - 10,
                  decoration: BoxDecoration(
                    color: Palette.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: Text(slotTextTwo),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
