import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_two/custom_widget.dart';

class RowColumnExample extends StatefulWidget {
  const RowColumnExample({super.key});

  @override
  State<RowColumnExample> createState() => _RowColumnExampleState();
}

class _RowColumnExampleState extends State<RowColumnExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            MyText("Detail", Colors.red, 16),
            MyText("Expense", Colors.red, 16),
            Icon(
              Icons.edit,
              opticalSize: 24,
            ),
            Icon(
              Icons.delete,
              opticalSize: 24,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            MyText("Fuel", Colors.red, 16),
            MyText("25000", Colors.red, 16),
            Icon(
              Icons.edit,
              opticalSize: 24,
            ),
            Icon(
              Icons.delete,
              opticalSize: 24,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            MyText("Toll tax", Colors.red, 16),
            MyText("5000", Colors.red, 16),
            Icon(
              Icons.edit,
              opticalSize: 24,
            ),
            Icon(
              Icons.delete,
              opticalSize: 24,
            ),
          ]),
        ],
      ),
    );
  }
}
