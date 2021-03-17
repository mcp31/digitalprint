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
  bool _showExtraOptions = false;

  TextEditingController _readPrintIndexController;
  TextEditingController _readPrintIndexLenController;

  void initState() {
    super.initState();
    _readPrintIndexController = TextEditingController();
    _readPrintIndexLenController = TextEditingController();
  }

  void dispose() {
    _readPrintIndexLenController.dispose();
    super.dispose();
  }

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
              Container(
                width: 300,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.all(0),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                    });
                  },
                ),
              ),
              Container(
                width: 300,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.all(0),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      _showExtraOptions = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              _showExtraOptions ? _extraOption() : Text(""),
            ],
          ),
          // Container(
          //   padding: EdgeInsets.only(bottom: 60.0, left: 20.0),
          //   child: _showDropDown ? _extraOption() : Text(""),
          // ),
          // _showDropDown ? _dropDown() : Text(""),
          Expanded(
            child: Container(
              height: _showExtraOptions ? 215 : 140,
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

  Widget _extraOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Read Print Index:",
              style: kCardBodyTextStyle,
            ),
            Container(
              color: Colors.grey[300],
              margin: EdgeInsets.only(
                left: 30.0,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              width: 250,
              //TODO: Have validator to only accept integers
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                  border: InputBorder.none,
                  hintText: "Enter pages in each cycle",
                ),
                controller: _readPrintIndexController,
                onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      //For debugging purposes
                      return AlertDialog(
                        title: const Text('Read Print Index'),
                        content: Text('You entered $value'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Read Print Index Len:",
              style: kCardBodyTextStyle,
            ),
            Container(
              color: Colors.grey[300],
              margin: EdgeInsets.only(
                left: 30.0,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              width: 250,
              //TODO: Have validator to only accept integers
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                  border: InputBorder.none,
                  hintText: "Enter cycle to split",
                ),
                controller: _readPrintIndexLenController,
                onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      //For debugging purposes
                      return AlertDialog(
                        title: const Text('Read Print Index'),
                        content: Text('You entered $value'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
