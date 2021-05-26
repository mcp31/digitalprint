import 'package:digital_print/xOffsets/xmlParser.dart';
import 'package:flutter/material.dart';
import 'package:digital_print/constants.dart';
import 'MakeHead.dart';
import 'ModuleClass.dart';
import 'HeadClass.dart';

//debugging purposes
final xmlParser = new SysTypeParser(
  "/Users/maryplana/Desktop/Projects/OpconfigRewrite/SysTypeXml.xml",
);

var headArray = xmlParser.getModuleCount(); //[4, 3, 2, 1];
//var headArray = [9, 5, 6, 4, 2];
var offSetsArray = xmlParser.getXoffsets(); //[4, 3, 2, 1];

class ModulesHomePage extends StatefulWidget {
  @override
  _ModulesHomePageState createState() => _ModulesHomePageState();
}

class _ModulesHomePageState extends State<ModulesHomePage> {
  List<Head> headList = [];
  List<int> deltaList = [];
  List<TextEditingController> textList = [];
  List<String> sysTypeList = xmlParser.getSysTypes();

  String selectedSysType;
  int headIndex = 0;
  final ScrollController _scrollController = ScrollController();
  double containerWidth;

  @override
  void initState() {
    super.initState();

    //TODO: Find a way to get current sysType

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

  //Redraw heads when different SysType is selected
  Widget drawSysType(int offSetIndex) {
    return ListView.builder(
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
        headList[index].moduleList.length = headList[index].numberOfModules;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: MakeHead(
            moduleCount: headList[index].numberOfModules,
            moduleList: headList[index].moduleList,
            headLabel: index + 1,
            screenSize: context,
            containerWidth: containerWidth,
            headList: headList,
            textList: textList,
            deltaList: deltaList,
          ),
        );
      },
    );
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
            //Dropdown Menu for System Type
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    "System Type:",
                    style: kCardHeaderTextStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: selectedSysType,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Colors.blue[700],
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        //TODO: How to make head redraw after a different sysType has been selected
                        this.selectedSysType = newValue;
                        xmlParser.setSysType(this.selectedSysType);
                        selectedSysType = this.selectedSysType;
                      });
                    },
                    items: xmlParser
                        .getSysTypes()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          width: 100,
                          child: Center(
                            child: Text(value),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            //Creates the head along with its contents
            //drawSysType(offSetIndex),
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
                  child: MakeHead(
                    moduleCount: headList[index].numberOfModules,
                    moduleList: headList[index].moduleList,
                    headLabel: index + 1,
                    screenSize: context,
                    containerWidth: containerWidth,
                    headList: headList,
                    textList: textList,
                    deltaList: deltaList,
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
}
