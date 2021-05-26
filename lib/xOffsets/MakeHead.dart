import 'package:digital_print/xOffsets/xmlParser.dart';
import 'package:flutter/material.dart';
import 'package:digital_print/constants.dart';
import 'ModuleClass.dart';
import 'HeadClass.dart';

class MakeHead extends StatefulWidget {
  int moduleCount;
  int headLabel;
  BuildContext screenSize;
  List moduleList;
  List deltaList;
  List headList;
  List textList;
  double containerWidth;

  MakeHead({
    @required this.moduleCount,
    @required this.moduleList,
    @required this.headLabel,
    @required this.screenSize,
    @required this.containerWidth,
    @required this.headList,
    @required this.textList,
    @required this.deltaList,
  });

  @override
  _MakeHeadState createState() => _MakeHeadState();
}

class _MakeHeadState extends State<MakeHead> {
  @override
  Widget build(BuildContext context) {
    double textBoxWidth = MediaQuery.of(widget.screenSize).size.width / 4;
    double graphicModuleContainerWidth =
        MediaQuery.of(widget.screenSize).size.width / 1.2;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Head #${widget.headLabel}",
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
                          itemCount: widget.moduleCount,
                          itemBuilder: (BuildContext context, int index) {
                            /*
                            Makes graphicModule decrease in size as more
                            modules are being displayed
                             */
                            if (widget.moduleCount > 6) {
                              widget.containerWidth = 112.5;
                            } else {
                              widget.containerWidth = 150;
                            }

                            if (index.isEven) {
                              return Column(
                                children: <Widget>[
                                  makeGraphicModule(
                                      index + 1,
                                      widget.containerWidth,
                                      widget.moduleCount),
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
                                      index + 1,
                                      widget.containerWidth,
                                      widget.moduleCount),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //   //Creates the graphic of the modules
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Container(
                //         width: graphicModuleContainerWidth,
                //         height: 100,
                //         child: ListView.builder(
                //           scrollDirection: Axis.horizontal,
                //           itemCount: moduleCount,
                //           itemBuilder: (BuildContext context, int index) {
                //             /*
                //             Makes graphicModule decrease in size as more
                //             modules are being displayed
                //              */
                //             if (moduleCount > 6) {
                //               containerWidth = 112.5;
                //             } else {
                //               containerWidth = 150;
                //             }
                //
                //             if (index.isEven) {
                //               return Column(
                //                 children: <Widget>[
                //                   makeGraphicModule(
                //                       index + 1, containerWidth, moduleCount),
                //                   SizedBox(
                //                     height: 50,
                //                   ),
                //                 ],
                //               );
                //             } else {
                //               return Column(
                //                 children: <Widget>[
                //                   SizedBox(
                //                     height: 50,
                //                   ),
                //                   makeGraphicModule(
                //                       index + 1, containerWidth, moduleCount),
                //                 ],
                //               );
                //             }
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: 20,
                ),

                //Creates the UI of the modules
                Container(
                  height: 95,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.moduleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return makeModule(
                        widget.moduleList[index],
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
                        controller: widget.textList[widget.headLabel - 1],
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
                        widget.deltaList[widget.headLabel - 1] = int.parse(
                            widget.textList[widget.headLabel - 1].text);

                        //Changes the value DISPLAYED on the modules
                        //in the Head class
                        setState(() {
                          widget.headList[widget.headLabel - 1]
                              .addDelta(widget.deltaList[widget.headLabel - 1]);
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
}
