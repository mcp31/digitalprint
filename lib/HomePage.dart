import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'constants.dart';

const kCardHeaderTextStyle = TextStyle(
  fontSize: 20.0,
  color: kSemiBlack,
  fontWeight: FontWeight.bold,
);

const kCardBodyTextStyle = TextStyle(fontSize: 18.0);
const kButtonTextStyle = TextStyle(fontSize: 18.0);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Different TextControllers are needed for each text input
  TextEditingController _blankCountController;
  TextEditingController _setupWidthController;

  bool _mergeSetupPageChecked = false;

  void initState() {
    super.initState();
    _blankCountController = TextEditingController();
    _setupWidthController = TextEditingController();
  }

  void dispose() {
    _blankCountController.dispose();
    _setupWidthController.dispose();
    super.dispose();
  }

  void _showTextResult() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trial Project - Operator Configuration"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //TODO: Separate each card set to its own file
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
                                    hintStyle: TextStyle(
                                        fontSize: 16.0, color: Colors.grey),
                                    border: InputBorder.none,
                                    hintText: "Enter number of blanks",
                                  ),
                                  controller: _blankCountController,
                                  onSubmitted: (String value) async {
                                    await showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        //For debugging purposes
                                        return AlertDialog(
                                          title: const Text('Blank Count'),
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
                                "Setup Width:",
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
                                    hintStyle: TextStyle(
                                        fontSize: 16.0, color: Colors.grey),
                                    border: InputBorder.none,
                                    hintText: "Enter width of setup page",
                                  ),
                                  controller: _setupWidthController,
                                  onSubmitted: (String value) async {
                                    await showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        //For debugging purposes
                                        return AlertDialog(
                                          title: const Text('Setup Width'),
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
              SizedBox(
                height: 30.0,
              ),
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
                child: Text(""),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Read and Print Options",
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
                child: Text(""),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                child: Text(""),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                child: Text(""),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                child: Text(""),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                child: Text(""),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                child: Text(""),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
