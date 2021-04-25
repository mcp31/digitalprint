import 'package:flutter/material.dart';
import '../constants.dart';

enum DelayOptions {
  ready,
  sort,
  speed,
  none,
}

class IOControl extends StatefulWidget {
  @override
  _IOControlState createState() => _IOControlState();
}

class _IOControlState extends State<IOControl> {
  DelayOptions _optionSelected = DelayOptions.none;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "I/O Control",
          style: kCardHeaderTextStyle,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            color: kOffWhite,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(1, 1),
                color: Colors.grey,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Ready Delay",
                            style: kCardBodyTextStyle,
                          ),
                          Text("Edit Speed Delay"),
                        ],
                      ),
                      leading: Radio<DelayOptions>(
                        value: DelayOptions.ready,
                        groupValue: _optionSelected,
                        onChanged: (DelayOptions value) {
                          setState(() {
                            _optionSelected = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Sort Delay",
                            style: kCardBodyTextStyle,
                          ),
                          Text("Edit Sort Delay"),
                        ],
                      ),
                      leading: Radio<DelayOptions>(
                        value: DelayOptions.sort,
                        groupValue: _optionSelected,
                        onChanged: (DelayOptions value) {
                          setState(() {
                            _optionSelected = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Speed Delay",
                            style: kCardBodyTextStyle,
                          ),
                          Text("Edit Ready Delay"),
                        ],
                      ),
                      leading: Radio<DelayOptions>(
                        value: DelayOptions.speed,
                        groupValue: _optionSelected,
                        onChanged: (DelayOptions value) {
                          setState(() {
                            _optionSelected = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 165,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      color: Colors.grey[600],
                      icon: Icon(
                        Icons.info,
                        size: 30.0,
                      ),
                      onPressed: () {
                        //TODO: Add information
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
