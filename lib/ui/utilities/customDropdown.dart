import 'package:dndmin/config/palette.dart';
import 'package:flutter/material.dart';

double height, width, xPosition, yPosition;
bool isDropdownOpened = false;
OverlayEntry floatingDropdown;

class CustomDropdown extends StatefulWidget {
  final String text;
  final List<DropDownItem> items;
  const CustomDropdown({Key key, @required this.text, this.items})
      : super(key: key);
  @override
  _CustomDropdownState createState() => _CustomDropdownState(items: items);
}

class _CustomDropdownState extends State<CustomDropdown> {
  final List<DropDownItem> items;
  _CustomDropdownState({@required this.items});
  GlobalKey actionKey;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 2 * height + 45,
        child: AnimatedContainer(
          duration: Duration(),
          child: DropDown(
            itemHeight: height,
            items: items,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropdownOpened) {
            floatingDropdown.remove();
          } else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropdown);
          }
          isDropdownOpened = !isDropdownOpened;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: const Color(0xFFEFEFEF),
        ),
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Text(
              widget.text,
              style: TextStyle(
                color: Palette.fontColor,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: Palette.fontColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final double itemHeight;
  final List<DropDownItem> items;
  const DropDown({Key key, this.itemHeight, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 10,
          child: Container(
            height: 2 * height + 40,
            child: SingleChildScrollView(
              child: Column(
                children: items,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onPressed;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;

  const DropDownItem({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.iconData,
    this.isSelected = false,
    this.isFirstItem = false,
    this.isLastItem = false,
  }) : super(key: key);

  factory DropDownItem.first(
      {@required String text,
      @required Function onPressed,
      IconData iconData,
      bool isSelected = false}) {
    return DropDownItem(
      onPressed: onPressed,
      text: text,
      iconData: iconData,
      isSelected: isSelected,
      isFirstItem: true,
    );
  }

  factory DropDownItem.last({
    @required String text,
    @required Function onPressed,
    IconData iconData,
    bool isSelected = false,
  }) {
    return DropDownItem(
      onPressed: onPressed,
      text: text,
      iconData: iconData,
      isSelected: isSelected,
      isLastItem: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirstItem ? Radius.circular(10) : Radius.zero,
          bottom: isLastItem ? Radius.circular(10) : Radius.zero,
        ),
        color: isSelected ? const Color(0xFFD8D8D8) : Palette.secondaryColor,
      ),
      child: FlatButton(
        disabledColor: const Color(0xFFD8D8D8),
        color: Palette.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: isFirstItem ? Radius.circular(10) : Radius.zero,
            bottom: isLastItem ? Radius.circular(10) : Radius.zero,
          ),
        ),
        height: double.infinity,
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: Palette.fontColor,
              ),
            ),
            Spacer(),
            Icon(
              iconData,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
