import 'package:flutter/material.dart';
import 'package:digital_print/constants.dart';
import 'ModuleClass.dart';

const kButtonSize = 30.0;

class ModulesHomePage extends StatefulWidget {
  @override
  _ModulesHomePageState createState() => _ModulesHomePageState();
}

class _ModulesHomePageState extends State<ModulesHomePage> {
  List<Module> moduleList = []; //dynamic growing list

  @override
  Widget build(BuildContext context) {
    //TODO: Implement with parser here

    moduleList.add(
      Module(label: "1", moduleValue: 0, incrementAmt: 1),
    );
    moduleList.add(
      Module(label: "2", moduleValue: 0, incrementAmt: 20),
    );
    moduleList.add(
      Module(label: "3", moduleValue: 0, incrementAmt: 37),
    );

    moduleList.length = 3; //Limits the amount of modules being printed out

    return Scaffold(
      appBar: AppBar(
        title: Text("xOffsets"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Head #1",
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  //TODO: Make it dynamic and use its own value
                  children: <Widget>[for (var i in moduleList) module(i)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Module Skeleton Code
  Widget module(Module module1) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "Module #${module1.getModuleLabel}",
              style: TextStyle(fontSize: 18),
            ),
            Container(
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5,
              ),
              padding: EdgeInsets.all(
                12,
              ),
              width: 150,
              height: 65,
              child: Text(
                "${module1.getModuleValue}",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 22,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  module1.add();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: kButtonSize,
                width: kButtonSize,
                child: Icon(
                  Icons.add,
                  color: kOffWhite,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (module1.getModuleValue > 0) {
                    module1.subtract();
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: kButtonSize,
                width: kButtonSize,
                child: Icon(
                  Icons.remove,
                  color: kOffWhite,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
