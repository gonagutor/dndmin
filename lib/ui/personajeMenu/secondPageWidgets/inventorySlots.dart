import 'package:dndmin/backend/inventory.dart';
import 'package:flutter/material.dart';
import 'all.dart';

class InventorySlots extends StatelessWidget {
  const InventorySlots({
    Key key,
    @required this.playerInventory,
  }) : super(key: key);

  final Inventario playerInventory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlotsRow(
          slotOne: 1,
          slotTwo: 2,
          slotTextOne: playerInventory.slot1,
          slotTextTwo: playerInventory.slot2,
        ),
        SlotsRow(
          slotOne: 3,
          slotTwo: 4,
          slotTextOne: playerInventory.slot3,
          slotTextTwo: playerInventory.slot4,
        ),
        SlotsRow(
          slotOne: 5,
          slotTwo: 6,
          slotTextOne: playerInventory.slot5,
          slotTextTwo: playerInventory.slot6,
        ),
        SlotsRow(
          slotOne: 7,
          slotTwo: 8,
          slotTextOne: playerInventory.slot7,
          slotTextTwo: playerInventory.slot8,
        ),
        SlotsRow(
          slotOne: 9,
          slotTwo: 10,
          slotTextOne: playerInventory.slot9,
          slotTextTwo: playerInventory.slot10,
        ),
        SlotsRow(
          slotOne: 11,
          slotTwo: 12,
          slotTextOne: playerInventory.slot11,
          slotTextTwo: playerInventory.slot12,
        ),
        SlotsRow(
          slotOne: 13,
          slotTwo: 14,
          slotTextOne: playerInventory.slot13,
          slotTextTwo: playerInventory.slot14,
        ),
        SlotsRow(
          slotOne: 16,
          slotTwo: 16,
          slotTextOne: playerInventory.slot15,
          slotTextTwo: playerInventory.slot16,
        ),
        SlotsRow(
          slotOne: 17,
          slotTwo: 18,
          slotTextOne: playerInventory.slot17,
          slotTextTwo: playerInventory.slot18,
        ),
        SlotsRow(
          slotOne: 19,
          slotTwo: 20,
          slotTextOne: playerInventory.slot19,
          slotTextTwo: playerInventory.slot20,
        ),
      ],
    );
  }
}
