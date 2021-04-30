import 'package:flutter/material.dart';
import 'package:digital_print/constants.dart';
import 'ModuleClass.dart';
import 'HeadClass.dart';

//debugging purposes
var headArray = [4, 3, 2, 1];

class ModulesHomePage extends StatefulWidget {
  @override
  _ModulesHomePageState createState() => _ModulesHomePageState();
}

class _ModulesHomePageState extends State<ModulesHomePage> {
  List<Head> headList = [];

  @override
  Widget build(BuildContext context) {
    //Implement with parser here
    //Creates a head object with the number of modules
    for (int i = 0; i < headArray.length; i++) {
      headList.add(
        Head(
          numberOfModules: headArray[i],
          moduleList: [],
        ),
      );
    }
    //Limits the amount of head UI being printed
    headList.length = headArray.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("xOffsets"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
          //vertical: 20.0,
        ),
        //Creates head with its number of modules
        child: ListView.builder(
          itemCount: headList.length,
          itemBuilder: (BuildContext context, int index) {
            //add module for the UI in a head
            for (int i = 0; i < headList[index].numberOfModules; i++) {
              headList[index].moduleList.add(
                    Module(
                      label: "${i + 1}",
                      moduleValue: 0,
                      incrementAmt: 10,
                    ),
                  );
            }

            //Limits the amount of module UI being printed
            headList[index].moduleList.length = headList[index].numberOfModules;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: makeHead(
                headList[index].numberOfModules,
                index + 1,
                headList[index].moduleList,
              ),
            );
          },
        ),
      ),
    );
  }

  //Head Skeleton Code
  Widget makeHead(int moduleCount, int headLabel, List moduleList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Head #$headLabel",
          style: kCardHeaderTextStyle,
        ),

        //Container housing the graphic and module count
        Container(
          height: 310,
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
          child: Column(
            children: <Widget>[
              //Heads
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                height: 150,

                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  border: Border.all(
                    width: .8,
                    color: Colors.grey[800],
                  ),
                ),

                //Creates the graphic of the modules
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 600,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: moduleCount,
                        itemBuilder: (BuildContext context, int index) {
                          if (index.isEven) {
                            return Column(
                              children: <Widget>[
                                makeGraphicModule(index + 1),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                ),
                                makeGraphicModule(index + 1),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              //Creates the UI of the modules
              Container(
                height: 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moduleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return makeModule(
                      moduleList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Module Skeleton Code
  Widget makeModule(Module module1) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "Module #${module1.getModuleLabel}",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              color: Colors.grey[300],
              margin: EdgeInsets.only(
                left: 30.0,
                right: 10,
                top: 5,
                bottom: 5,
              ),
              padding: EdgeInsets.all(
                12,
              ),
              width: 170,
              height: 60,
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

  Widget makeGraphicModule(int modNum) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green[400],
        border: Border.all(
          width: 1,
          color: Colors.green[400],
        ),
      ),
      child: Center(
        child: Text(
          "Mod $modNum",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
