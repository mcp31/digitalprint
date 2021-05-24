import 'package:digital_print/xOffsets/xmlParser.dart';
import 'package:flutter/material.dart';
import 'package:digital_print/constants.dart';
import 'ModuleClass.dart';
import 'HeadClass.dart';

//debugging purposes
final xmlParser = new SysTypeParser(
  "/Users/maryplana/Desktop/Projects/OpconfigRewrite/SysTypeXml.xml",
);

//var headArray = xmlParser.getModuleCount(); //[4, 3, 2, 1];
var headArray = [10, 8, 6, 4, 2];
var offSetsArray = xmlParser.getXoffsets(); //[4, 3, 2, 1];

class ModulesHomePage extends StatefulWidget {
  @override
  _ModulesHomePageState createState() => _ModulesHomePageState();
}

class _ModulesHomePageState extends State<ModulesHomePage> {
  List<Head> headList = [];
  List<int> deltaList = [];
  List<TextEditingController> textList = [];
  int headIndex = 0;

  final ScrollController _scrollController = ScrollController();
  double containerWidth;

  @override
  void initState() {
    super.initState();
    for (TextEditingController i in textList) {
      i = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (TextEditingController i in textList) {
      i.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Creates a head object with the number of modules
    for (int i = 0; i < headArray.length; i++) {
      headList.add(
        Head(
          numberOfModules: headArray[i],
          moduleList: [],
        ),
      );
      deltaList.add(0);
      textList.add(TextEditingController());
    }
    //Limits the amount of head UI being printed
    headList.length = headArray.length;

    var offSetIndex = 0;
    List<String> newValues = [];

    return Scaffold(
      appBar: AppBar(
        title: Text("xOffsets"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Apply",
          style: TextStyle(fontSize: 20),
        ),
        icon: Icon(Icons.arrow_upward),
        onPressed: () {
          //Is there a better/cleaner way to do this?

          //get module values for each head
          for (int i = 0; i < headList.length; i++) {
            for (final i in headList[i].moduleList) {
              newValues.add(i.moduleValue.toString());
            }
          }

          //debugging purposes
          for (int i = 0; i < offSetsArray.length; i++) {
            print("new values = ${newValues[i]}");
          }
          xmlParser.setXoffsets(newValues);
        },
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          children: <Widget>[
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: headList.length,
              itemBuilder: (BuildContext context, int index) {
                //add module for the UI in a head
                for (int i = 0; i < headList[index].numberOfModules; i++) {
                  headList[index].moduleList.add(
                        Module(
                          label: "${i + 1}",
                          moduleValue: offSetsArray[offSetIndex],
                          incrementAmt: 10,
                        ),
                      );
                  offSetIndex++;
                  if (offSetIndex >= offSetsArray.length) {
                    offSetIndex = 0;
                  }
                }

                //Limits the amount of module UI being printed
                headList[index].moduleList.length =
                    headList[index].numberOfModules;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: makeHead(
                    headList[index].numberOfModules,
                    index + 1,
                    headList[index].moduleList,
                    context,
                  ),
                );
              },
            ),
          ],
        ),
        isAlwaysShown: true,
      ),
    );
  }

  //Head Skeleton Code
  Widget makeHead(
      int moduleCount, int headLabel, List moduleList, BuildContext context) {
    double textBoxWidth = MediaQuery.of(context).size.width / 4;
    double graphicModuleContainerWidth =
        MediaQuery.of(context).size.width / 1.2;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Head #$headLabel",
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: graphicModuleContainerWidth,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: moduleCount,
                          itemBuilder: (BuildContext context, int index) {
                            /*
                            Makes graphicModule decrease in size as more
                            modules are being displayed
                             */
                            if (moduleCount > 6) {
                              containerWidth = 112.5;
                            } else {
                              containerWidth = 150;
                            }

                            if (index.isEven) {
                              return Column(
                                children: <Widget>[
                                  makeGraphicModule(
                                      index + 1, containerWidth, moduleCount),
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
                                  makeGraphicModule(
                                      index + 1, containerWidth, moduleCount),
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
                SizedBox(
                  height: 20,
                ),

                //Delta
                Text(
                  "Delta",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[700],
                        ),
                      ),
                      width: textBoxWidth,
                      child: TextFormField(
                        controller: textList[headLabel - 1],
                        decoration: InputDecoration(
                          filled: true,
                          border: InputBorder.none,
                          hintText: "Inches",
                          hintTextDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Gets the text in the textfield and turn it into an int
                        deltaList[headLabel - 1] =
                            int.parse(textList[headLabel - 1].text);

                        //Changes the value DISPLAYED on the modules
                        //in the Head class
                        setState(() {
                          headList[headLabel - 1]
                              .addDelta(deltaList[headLabel - 1]);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Apply Delta",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Module Skeleton Code
  Widget makeModule(Module module) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Module #${module.getModuleLabel}",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[700],
                ),
                color: Colors.grey[300],
              ),
              margin: EdgeInsets.only(
                //left: 30.0,
                right: 10,
                top: 5,
                bottom: 5,
              ),
              padding: EdgeInsets.all(
                12,
              ),
              width: 150,
              height: 60,
              child: Text(
                "${module.getModuleValue}",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 20,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    module.add();
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
                    if (module.getModuleValue > 0) {
                      module.subtract();
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
        ),
      ],
    );
  }

  Widget makeGraphicModule(int modNum, double containerWidth, int moduleCount) {
    if (modNum == 1 && modNum == moduleCount) {
      return Container(
        width: containerWidth,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green[400],
          border: Border.all(
            width: 2,
            color: kSemiBlack,
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
    } else if (modNum == 1 && modNum != moduleCount) {
      return Container(
        width: containerWidth,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green[400],
          border: Border(
            top: BorderSide(width: 2, color: kSemiBlack),
            bottom: BorderSide(width: 2, color: kSemiBlack),
            left: BorderSide(width: 2, color: kSemiBlack),
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
    } else if (modNum.isEven && modNum != moduleCount ||
        modNum.isOdd && modNum != moduleCount) {
      return Container(
        width: containerWidth,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green[400],
          border: Border(
            top: BorderSide(width: 2, color: kSemiBlack),
            bottom: BorderSide(width: 2, color: kSemiBlack),
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
    } else if (modNum == moduleCount) {
      return Container(
        width: containerWidth,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green[400],
          border: Border(
            top: BorderSide(width: 2, color: kSemiBlack),
            bottom: BorderSide(width: 2, color: kSemiBlack),
            right: BorderSide(width: 2, color: kSemiBlack),
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
}
