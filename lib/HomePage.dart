import 'package:digital_print/BitTickleCard.dart';
import 'package:digital_print/BundleOptionCard.dart';
import 'package:digital_print/CalibrateEncoder.dart';
import 'package:digital_print/IOControl.dart';
import 'package:digital_print/MeteorConfigCard.dart';
import 'package:digital_print/ReadPrintCard.dart';
import 'package:digital_print/SetupCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Different TextControllers are needed for each text input

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
              SetupCard(),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Bit Tickle Settings",
                style: kCardHeaderTextStyle,
              ),
              BitTickleCard(),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Read and Print Options",
                style: kCardHeaderTextStyle,
              ),
              ReadPrintCard(),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Calibrate Encoder",
                style: kCardHeaderTextStyle,
              ),
              CalibrateEncoder(),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Meteor Config Directory",
                style: kCardHeaderTextStyle,
              ),
              MeteorConfigCard(),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "I/O Control",
                style: kCardHeaderTextStyle,
              ),
              IOControl(),
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
              BundleOptionsCard(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
