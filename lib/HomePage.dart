import 'package:digital_print/BitTickleCard.dart';
import 'package:digital_print/BundleOptionCard.dart';
import 'package:digital_print/CalibrateEncoder.dart';
import 'package:digital_print/IOControl.dart';
import 'package:digital_print/MeteorConfigCard.dart';
import 'package:digital_print/ReadPrintCard.dart';
import 'package:digital_print/SetupCard.dart';
import 'SortDelayCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'constants.dart';
import 'SearchBar.dart';

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
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: CardSearch());
          },
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       showSearch(context: context, delegate: CardSearch());
        //     },
        //   ),
        // ],
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
              SetupCard(),
              SizedBox(
                height: 30.0,
              ),
              BitTickleCard(),
              SizedBox(
                height: 30.0,
              ),
              ReadPrintCard(),
              SizedBox(
                height: 30.0,
              ),
              CalibrateEncoder(),
              SizedBox(
                height: 30.0,
              ),
              MeteorConfigCard(),
              SizedBox(
                height: 30.0,
              ),
              IOControl(),
              SizedBox(
                height: 30.0,
              ),
              SortDelayCard(),
              SizedBox(
                height: 30.0,
              ),
              BundleOptionsCard(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
