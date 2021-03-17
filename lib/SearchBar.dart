import 'package:digital_print/BitTickleCard.dart';
import 'package:digital_print/BundleOptionCard.dart';
import 'package:digital_print/CalibrateEncoder.dart';
import 'package:digital_print/IOControl.dart';
import 'package:digital_print/MeteorConfigCard.dart';
import 'package:digital_print/ReadPrintCard.dart';
import 'package:digital_print/SetupCard.dart';
import 'SortDelayCard.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class CardSearch extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.blue[700],
      hintColor: Colors.blue[300],
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show result based on selection
    switch (query) {
      case "Setup Page":
        {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: SetupCard(),
          );
        }
        break;
      case "Bit Tickle Settings":
        {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: BitTickleCard(),
          );
        }
        break;
      case "Read and Print Options":
        {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: ReadPrintCard(),
          );
        }
        break;
      case "Calibrate Encoder":
        {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: CalibrateEncoder(),
          );
        }
        break;
      case "Meteor Config Directory":
        {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: MeteorConfigCard(),
          );
        }
        break;
      case "IO Control":
        {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: IOControl(),
          );
        }
        break;
      case "Sort Delay":
        {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: SortDelayCard(),
          );
        }
        break;
      case "Bundle Options":
        {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: BundleOptionsCard(),
          );
        }
        break;
      default:
        {
          return Text(query);
        }
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something
    final suggestionList = query.isEmpty
        ? _listOfCards
        : _listOfCards.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
        leading: Icon(Icons.search),
        title: Text(suggestionList[index]),
      ),
    );
  }

  final List<String> _listOfCards = [
    "Setup Page",
    "Bit Tickle Settings",
    "Read and Print Options",
    "Calibrate Encoder",
    "Meteor Config Directory",
    "IO Control",
    "Sort Delay",
    "Bundle Options",
  ];

  final List<String> _recentCards = [
    "Read and Print Options",
    "Calibrate Encoder",
    "Meteor Config Directory",
  ];
}
