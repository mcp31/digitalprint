import 'package:flutter/material.dart';
import 'package:digital_print/constants.dart';
import 'ModuleClass.dart';

//debugging purposes
int numberOfModules = 4;

//TODO: Make default orientation to be landscape

class ModulesHomePage extends StatefulWidget {
  @override
  _ModulesHomePageState createState() => _ModulesHomePageState();
}

class _ModulesHomePageState extends State<ModulesHomePage> {
  List<Module> moduleList = []; //dynamic growing list

  @override
  Widget build(BuildContext context) {
    //TODO: Implement with parser here

    for (int i = 0; i < numberOfModules; i++) {
      moduleList
          .add(Module(label: "${i + 1}", moduleValue: 0, incrementAmt: 1));
    }

    moduleList.length =
        numberOfModules; //Limits the amount of modules being printed out

    return Scaffold(
      appBar: AppBar(
        title: Text("xOffsets"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 20.0,
        ),

        //Start Head Code
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Head #1",
              style: kCardHeaderTextStyle,
            ),

            //Container housing the graphic and module count
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
              child: Column(
                children: <Widget>[
                  //Heads
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 600,
                          height: 100,
                          child: Center(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: numberOfModules,
                              itemBuilder: (BuildContext context, int index) {
                                if (index.isEven) {
                                  return Column(
                                    children: <Widget>[
                                      graphicModule(index + 1),
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
                                      graphicModule(index + 1),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //Modules
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //TODO: Make it dynamic and use its own value
                      children: <Widget>[for (var i in moduleList) module(i)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Head Skeleton Code
  Widget head(int moduleCount, int headCount) {
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Head #$headCount",
          style: kCardHeaderTextStyle,
        ),

        //Container housing the graphic and module count
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
          child: Column(
            children: <Widget>[
              //Heads
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 600,
                      height: 100,
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: numberOfModules,
                          itemBuilder: (BuildContext context, int index) {
                            if (index.isEven) {
                              return Column(
                                children: <Widget>[
                                  graphicModule(index + 1),
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
                                  graphicModule(index + 1),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              //Modules
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  //TODO: Make it dynamic and use its own value
                  children: <Widget>[for (var i in moduleList) module(i)],
                ),
              ),
            ],
          ),
        ),
      ],
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
              width: 120,
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

  Widget graphicModule(int modNum) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Center(
        child: Text(
          "Module $modNum",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
