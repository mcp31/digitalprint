import 'package:digital_print/SysTypeSelect/SysTypeSelectHomePage.dart';
import 'package:digital_print/constants.dart';
import 'package:digital_print/xOffsets/ModulesHomePage.dart';
import 'package:flutter/material.dart';
import 'OpConfig/HomePage.dart';

/*
  For setting default orientation to landscape for xOffsets
  https://mightytechno.com/screen-orientation-in-flutter/
 */

var startPara;

void main(List<String> args) {
  //can have parameters; "hardcoding
  print("Arguments");
  print(args.toString());
  startPara = args.toString();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     switch (startPara) {
//       case 1:
//         {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               primaryColor: Colors.blue[700],
//               scaffoldBackgroundColor: kOffWhite,
//             ),
//             home: MyHomePage(),
//             //home: ModulesHomePage(),
//           );
//         }
//       case 2:
//         {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               primaryColor: Colors.blue[700],
//               scaffoldBackgroundColor: kOffWhite,
//             ),
//             //home: MyHomePage(),
//             home: ModulesHomePage(),
//           );
//         }
//       case 3:
//         {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               primaryColor: Colors.blue[700],
//               scaffoldBackgroundColor: kOffWhite,
//             ),
//             //home: MyHomePage(),
//             //home: ModulesHomePage(),
//             home: SysTypeSelectHomePage(),
//           );
//         }
//       default:
//         {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               primaryColor: Colors.blue[700],
//               scaffoldBackgroundColor: kOffWhite,
//             ),
//             home: MyHomePage(),
//             //home: ModulesHomePage(),
//           );
//         }
//     }
//   }
// }

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
      //home: MyHomePage(),
      //home: ModulesHomePage(),
      home: SysTypeSelectHomePage(),
    );
  }
}
