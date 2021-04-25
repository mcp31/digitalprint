import 'package:flutter/material.dart';
import '../constants.dart';
import '../DpiIniController.dart';

class SortDelayCard extends StatefulWidget {
  @override
  _SortDelayCardState createState() => _SortDelayCardState();
}

class _SortDelayCardState extends State<SortDelayCard> {
  TextEditingController _delayController;
  TextEditingController _durationController;
  TextEditingController _pageOffsetController;
  bool _timeDelay = false;
  bool _distance = false;
  bool _invert = false;

  void initState() {
    super.initState();
    _delayController = TextEditingController();
    _durationController = TextEditingController();

    _pageOffsetController = TextEditingController();
    _pageOffsetController.text =
        readSettingsPrintFile("METEOR", "iBB_PageOffset");
  }

  void dispose() {
    _delayController.dispose();
    _durationController.dispose();
    _pageOffsetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Sort Delay",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  //Delay
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Delay:",
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
                            hintText: "Enter output delay",
                          ),
                          controller: _delayController,
                          onSubmitted: (String value) async {
                            await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                //For debugging purposes
                                return AlertDialog(
                                  title: const Text('Delay'),
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

                  //Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //TODO: Have way to convert duration between in and ms
                      Text(
                        "Duration:",
                        style: kCardBodyTextStyle,
                      ),
                      Container(
                        color: Colors.grey[300],
                        margin: EdgeInsets.only(
                          left: 32.0,
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
                            hintText: "Enter output duration",
                          ),
                          controller: _durationController,
                          onSubmitted: (String value) async {
                            await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                //For debugging purposes
                                return AlertDialog(
                                  title: const Text('Duration'),
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

                  //Page Offset
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "(-) Page Offset:",
                        style: kCardBodyTextStyle,
                      ),
                      Container(
                        color: Colors.grey[300],
                        margin: EdgeInsets.only(
                          left: 32.0,
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
                            hintText: "Enter pages to retard sort",
                          ),
                          controller: _pageOffsetController,
                          onSubmitted: (String value) async {
                            //converts string to int for condition
                            int valueInt = int.parse(value);

                            if (valueInt < 0) {
                              await showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  //For debugging purposes
                                  return AlertDialog(
                                    title: const Text('Out of Range'),
                                    content: Text('Enter values above 0'),
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
                                  "METEOR", "iBB_PageOffset", value);
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
                    margin: EdgeInsets.only(right: 110.0),
                    width: 300,
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Time Delay",
                            style: kCardBodyTextStyle,
                          ),
                          Text("Set value based on time"),
                        ],
                      ),
                      value: _timeDelay,
                      onChanged: (bool value) {
                        setState(() {
                          _timeDelay = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 110.0),
                    width: 300,
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Distance",
                            style: kCardBodyTextStyle,
                          ),
                          Text("Set value based on distance"),
                        ],
                      ),
                      value: _distance,
                      onChanged: (bool value) {
                        setState(() {
                          _distance = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 110.0),
                    width: 300,
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Invert",
                            style: kCardBodyTextStyle,
                          ),
                          Text("Invert state of output"),
                        ],
                      ),
                      value: _invert,
                      onChanged: (bool value) {
                        setState(() {
                          _invert = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 250.0),
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                      ),
                      onPressed: () {
                        //TODO: Add functionality for apply these settings
                      },
                      child: Text(
                        "Apply",
                        style: kButtonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: 420,
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
