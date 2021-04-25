import 'package:flutter/material.dart';
import '../constants.dart';

class CalibrateEncoder extends StatefulWidget {
  @override
  _CalibrateEncoderState createState() => _CalibrateEncoderState();
}

class _CalibrateEncoderState extends State<CalibrateEncoder> {
  TextEditingController _multiplierController;
  TextEditingController _dividerController;
  TextEditingController _targetLengthController;
  TextEditingController _measuredLengthController;

  void initState() {
    super.initState();
    _multiplierController = TextEditingController();
    _dividerController = TextEditingController();
    _targetLengthController = TextEditingController();
    _measuredLengthController = TextEditingController();
  }

  void dispose() {
    _multiplierController.dispose();
    _dividerController.dispose();
    _targetLengthController.dispose();
    _measuredLengthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Calibrate Encoder",
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Multiplier:",
                          style: kCardBodyTextStyle,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.only(
                              left: 100.0,
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
                                hintText: "Enter encoder multipler",
                              ),
                              controller: _multiplierController,
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Divider:",
                          style: kCardBodyTextStyle,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.only(
                              left: 120.0,
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
                                hintText: "Enter encoder divider",
                              ),
                              controller: _dividerController,
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Target Length:",
                          style: kCardBodyTextStyle,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.only(
                              left: 65.0,
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
                                hintText: "Enter length of image",
                              ),
                              controller: _targetLengthController,
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Measured Length:",
                          style: kCardBodyTextStyle,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.only(
                              left: 35.0,
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
                                hintText: "Enter length of image",
                              ),
                              controller: _measuredLengthController,
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 220,
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
