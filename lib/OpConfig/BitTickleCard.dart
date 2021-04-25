import 'package:flutter/material.dart';
import '../constants.dart';
import '../DpiIniController.dart';

class BitTickleCard extends StatefulWidget {
  @override
  _BitTickleCardState createState() => _BitTickleCardState();
}

class _BitTickleCardState extends State<BitTickleCard> {
  TextEditingController _tickleSizeController;
  TextEditingController _tickleCycleController;
  TextEditingController _spitCountController;

  void initState() {
    super.initState();
    _tickleSizeController = TextEditingController();
    _tickleSizeController.text = readSettingsPrintFile("System", "TickleSize");

    _tickleCycleController = TextEditingController();
    _tickleCycleController.text =
        readSettingsPrintFile("System", "TickleCycle");

    _spitCountController = TextEditingController();
    _spitCountController.text = readSettingsPrintFile("METEOR", "iSpitAmount");
  }

  void dispose() {
    _tickleSizeController.dispose();
    _tickleCycleController.dispose();
    _spitCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Bit Tickle Settings",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Tickle Size
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tickle Size:",
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
                            hintText: "Enter pixel element size",
                          ),
                          controller: _tickleSizeController,
                          onSubmitted: (String value) async {
                            //converts string to int for condition
                            int valueInt = int.parse(value);

                            //range 10 can change
                            if (valueInt > 0 && valueInt <= 10) {
                              writeSettingsPrintFile(
                                  "System", "TickleSize", value);
                            } else {
                              await showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  //TODO: Implement a better way of error handling
                                  return AlertDialog(
                                    title:
                                        const Text('Tickle Size is too high'),
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
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  //Tickle Cycle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tickle Cycle:",
                        style: kCardBodyTextStyle,
                      ),
                      Container(
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
                            hintStyle:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                            border: InputBorder.none,
                            hintText: "Enter pages in each cycle",
                          ),
                          controller: _tickleCycleController,
                          onSubmitted: (String value) async {
                            //converts string to int for condition
                            int valueInt = int.parse(value);

                            //range 1000 can change
                            if (valueInt > 0 && valueInt <= 1000) {
                              writeSettingsPrintFile(
                                  "System", "TickleCycle", value);
                            } else {
                              await showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  //TODO: Implement a better way of error handling
                                  return AlertDialog(
                                    title: const Text('Out of Range'),
                                    content:
                                        Text('Enter values between 0 - 1,000'),
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
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  //Spit Count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Spit Count:",
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
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                            border: InputBorder.none,
                            hintText: "Enter number of cycle to spit",
                          ),
                          controller: _spitCountController,
                          onSubmitted: (String value) async {
                            //converts string to int for condition
                            int valueInt = int.parse(value);

                            //range 10000 can change
                            if (valueInt > 0 && valueInt <= 10000) {
                              writeSettingsPrintFile(
                                  "METEOR", "iSpitAmount", value);
                            } else {
                              await showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  //TODO: Implement a better way of error handling
                                  return AlertDialog(
                                    title: const Text('Out of Range'),
                                    content:
                                        Text('Enter values between 0 - 10,000'),
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
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: 170,
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
