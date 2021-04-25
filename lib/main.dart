import 'package:digital_print/constants.dart';
import 'package:digital_print/xOffsets/ModulesHomePage.dart';
import 'package:flutter/material.dart';
import 'OpConfig/HomePage.dart';

var startPara;

void main(List<String> args) {
  //can have parameters; "hardcoding
  print("Arguments");
  print(args.toString());
  startPara = args.toString();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: kOffWhite,
      ),

      /*
      Currently, there's no way to execute different screens
      at the command line
       */

      //home: MyHomePage(),
      home: ModulesHomePage(),
    );
  }
}
