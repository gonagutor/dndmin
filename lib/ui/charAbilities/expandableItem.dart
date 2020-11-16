import 'package:dndmin/config/palette.dart';
import 'package:dndmin/ui/utilities/customDropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExpandableItem extends StatefulWidget {
  final String description;
  final String name;
  final String owner;
  final int id;

  ExpandableItem({
    @required this.description,
    @required this.name,
    this.owner,
    this.id,
  });
  @override
  _ExpandableItemState createState() => _ExpandableItemState(
        name: name,
        description: description,
        owner: owner,
        id: id,
      );
}

class _ExpandableItemState extends State<ExpandableItem> {
  final String description;
  final String name;
  final String owner;
  final int id;

  _ExpandableItemState({
    @required this.description,
    @required this.name,
    this.owner,
    this.id,
  });
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          children: [
            FlatButton(
              shape: RoundedRectangleBorder(
                side: (open)
                    ? BorderSide.none
                    : BorderSide(color: Palette.fontColor),
              ),
              padding: EdgeInsets.all(10),
              color: (open) ? Colors.grey[200] : Colors.white,
              onPressed: () {
                setState(() {
                  open = !open;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 140,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Palette.fontColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: Palette.fontColor,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              color: Colors.grey[200],
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height: (open) ? height : 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  description,
                  style: TextStyle(color: Palette.fontColor, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
