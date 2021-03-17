import 'package:flutter/material.dart';
import 'constants.dart';

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
    _tickleCycleController = TextEditingController();
    _spitCountController = TextEditingController();
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
                            await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                //For debugging purposes
                                return AlertDialog(
                                  title: const Text('Tickle Size'),
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
                            await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                //For debugging purposes
                                return AlertDialog(
                                  title: const Text('Tickle Cycle'),
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
                        //TODO: Have validator to only accept integers
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                            border: InputBorder.none,
                            hintText: "Enter number of cycle to spit",
                          ),
                          controller: _spitCountController,
                          onSubmitted: (String value) async {
                            await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                //For debugging purposes
                                return AlertDialog(
                                  title: const Text('Spit Count'),
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
