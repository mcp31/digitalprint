import 'package:flutter/material.dart';
import '../constants.dart';
import '../DpiIniController.dart';

class BundleOptionsCard extends StatefulWidget {
  @override
  _BundleOptionsCardState createState() => _BundleOptionsCardState();
}

class _BundleOptionsCardState extends State<BundleOptionsCard> {
  TextEditingController _bundleSizeController;
  bool _autoBundleChecked = false;
  String _autoBundle = "0";

  void initState() {
    super.initState();
    _bundleSizeController = TextEditingController();
    _bundleSizeController.text =
        readSettingsPrintFile("METEOR", "iAutoBundleSize");
  }

  void dispose() {
    _bundleSizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Bundle Options",
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
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Bundle Size:",
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
                              hintStyle:
                                  TextStyle(fontSize: 16.0, color: Colors.grey),
                              border: InputBorder.none,
                              hintText: "Enter size of stack bundle",
                            ),
                            controller: _bundleSizeController,
                            onSubmitted: (String value) async {
                              //converts string to int for condition
                              int valueInt = int.parse(value);

                              if (valueInt < 1) {
                                await showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    //For debugging purposes
                                    return AlertDialog(
                                      title: const Text('Out of Range'),
                                      content: Text('Enter values above 1'),
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
                              } else {
                                writeSettingsPrintFile(
                                    "METEOR", "iAutoBundleSize", value);
                              }
                            },
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
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Auto Bundle",
                              style: kCardBodyTextStyle,
                            ),
                            Text(
                              "Enables auto bundle mode",
                            ),
                          ],
                        ),
                        value: _autoBundleChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _autoBundleChecked = value;
                          });

                          if (_autoBundleChecked == true) {
                            _autoBundle = "1";
                          } else {
                            _autoBundle = "0";
                          }

                          writeSettingsPrintFile(
                              "METEOR", "bAutoBundle", _autoBundle);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 110,
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
