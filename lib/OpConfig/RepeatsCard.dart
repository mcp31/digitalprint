import 'package:flutter/material.dart';
import 'package:digital_print/constants.dart';
import 'package:digital_print/DpiIniController.dart';

class RepeatsCard extends StatefulWidget {
  @override
  _RepeatsCardState createState() => _RepeatsCardState();
}

class _RepeatsCardState extends State<RepeatsCard> {
  bool repeatToggle = false;
  String repeatOnOff = "0";

  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Repeats",
          style: kCardHeaderTextStyle,
        ),
        SizedBox(
          width: 10,
        ),
        Switch(
          value: repeatToggle,
          onChanged: (value) {
            setState(() {
              repeatToggle = value;
            });

            if (repeatToggle) {
              repeatOnOff = "1";
            } else {
              repeatOnOff = "0";
            }

            writeSettingsWinimFile("System", "NoRepeats", repeatOnOff);
          },
        ),
      ],
    );
  }
}
