import 'package:flutter/material.dart';
import 'constants.dart';

class ReadPrintCard extends StatefulWidget {
  @override
  _ReadPrintCardState createState() => _ReadPrintCardState();
}

class _ReadPrintCardState extends State<ReadPrintCard> {
  bool _readPrintChecked = false;
  bool _readLookUp = false;
  String dropdownValue = 'Option 1';
  bool _showDropDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                      title: Column(
                        children: <Widget>[
                          Text(
                            "Read Print",
                            style: kCardBodyTextStyle,
                          ),
                          Text("Enables read and print mode"),
                        ],
                      ),
                      value: _readPrintChecked,
                      onChanged: (bool value) {
                        //TODO: If checked, have a drop down box
                        setState(() {
                          _readPrintChecked = value;
                          _showDropDown = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                      title: Column(
                        children: <Widget>[
                          Text(
                            "Read Lookup Prt.",
                            style: kCardBodyTextStyle,
                          ),
                          Text("Enables print look-up mode"),
                        ],
                      ),
                      value: _readLookUp,
                      onChanged: (bool value) {
                        setState(() {
                          _readLookUp = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 60.0, left: 20.0),
            child: _showDropDown ? _dropDown() : Text(""),
          ),
          // _showDropDown ? _dropDown() : Text(""),
          Expanded(
            child: Container(
              height: 140,
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
    );
  }

  Widget _dropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 30,
      elevation: 16,
      //style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.blue[700],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Option 1', 'Option 2', 'Option 3', 'and more']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}
