import 'package:flutter/material.dart';
import '../constants.dart';
import '../DpiIniController.dart';

class SetupCard extends StatefulWidget {
  @override
  _SetupCardState createState() => _SetupCardState();
}

class _SetupCardState extends State<SetupCard> {
  TextEditingController _blankCountController;
  TextEditingController _setupWidthController;

  bool _mergeSetupPageChecked = false;
  String _mergeChecked = "0";

  void initState() {
    super.initState();
    _blankCountController = TextEditingController();
    _blankCountController.text = readSettingsPrintFile("System", "BlankCount");
    _setupWidthController = TextEditingController();
    _setupWidthController.text =
        readSettingsPrintFile("System", "DefaultSetupWidth");
  }

  void dispose() {
    _blankCountController.dispose();
    _setupWidthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Setup Page",
          style: kCardHeaderTextStyle,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
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
          //TODO: Have child in a separate file later
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Blank Count:",
                          style: kCardBodyTextStyle,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            width: 250,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.grey),
                                border: InputBorder.none,
                                hintText: "Enter number of blanks",
                              ),
                              controller: _blankCountController,
                              onSubmitted: (String value) async {
                                //converts string to int for condition
                                int valueInt = int.parse(value);

                                if (valueInt > 0 && valueInt <= 10) {
                                  writeSettingsPrintFile(
                                      "System", "BlankCount", value);
                                } else {
                                  await showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      //For debugging purposes
                                      return AlertDialog(
                                        title: const Text(
                                            'Blank Count is too high'),
                                        content:
                                            Text('Enter values between 0 - 10'),
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
                                }
                              },
                            ),
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
                          "Setup Width:",
                          style: kCardBodyTextStyle,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            width: 250,
                            //TODO: Have validator to only accept integers
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.grey),
                                border: InputBorder.none,
                                hintText: "Enter width of setup page",
                              ),
                              controller: _setupWidthController,
                              onSubmitted: (String value) async {
                                writeSettingsPrintFile(
                                    "System", "DefaultSetupWidth", value);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      //width: 200,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Merge Setup Page",
                          style: kCardBodyTextStyle,
                        ),
                        value: _mergeSetupPageChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _mergeSetupPageChecked = value;
                          });

                          if (_mergeSetupPageChecked == true) {
                            _mergeChecked = "1";
                          } else {
                            _mergeChecked = "0";
                          }

                          writeSettingsPrintFile(
                              "System", "MergeSetupPage", _mergeChecked);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Auto:",
                      style: kCardBodyTextStyle,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        onPressed: () {
                          //TODO: Add functionality for setup page
                          writeSettingsPrintFile(
                              "METEOR", "bUseMeteorScale50", "50");
                          //This will automatically write to the ini file
                        },
                        child: Text(
                          "Setup Page",
                          style: kButtonTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                        ),
                        onPressed: () {
                          //TODO: Add functionality for setup auto
                        },
                        child: Text(
                          "Setup (Auto)",
                          style: kButtonTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 180.0,
                      ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
