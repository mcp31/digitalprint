import 'package:flutter/material.dart';
import '../constants.dart';

class MeteorConfigCard extends StatefulWidget {
  @override
  _MeteorConfigCardState createState() => _MeteorConfigCardState();
}

class _MeteorConfigCardState extends State<MeteorConfigCard> {
  bool _reverseDirectory = false;
  String dropdownValue = 'C:\\dpi\\Configfiles\\';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Meteor Config Directory",
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
                    //Dropdown menu
                    _FilePathDropDown(),
                    //checkbox
                    Container(
                      //width: 200,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Reverse Directory",
                          style: kCardBodyTextStyle,
                        ),
                        value: _reverseDirectory,
                        onChanged: (bool value) {
                          setState(() {
                            _reverseDirectory = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
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

  Widget _FilePathDropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 30,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.blue[700],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'C:\\dpi\\Configfiles\\',
        'filepath 1',
        'filepath 2',
        'filepath 3',
        'and more',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 150.0,
              left: 10.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}
