import 'package:digital_print/xOffsets/ModuleClass.dart';
import 'package:flutter/material.dart';
import 'package:digital_print/constants.dart';

class MakeHeadGraphics extends StatefulWidget {
  int moduleCount;
  int headLabel;
  BuildContext screenSize;
  List moduleList;
  //List deltaList;
  List headList;
  //List textList;
  double containerWidth;

  MakeHeadGraphics({
    @required this.moduleCount,
    @required this.moduleList,
    @required this.headLabel,
    @required this.screenSize,
    @required this.containerWidth,
    @required this.headList,
    // @required this.textList,
    // @required this.deltaList,
  });

  @override
  _MakeHeadGraphicsState createState() => _MakeHeadGraphicsState();
}

class _MakeHeadGraphicsState extends State<MakeHeadGraphics> {
  @override
  Widget build(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: graphicModuleContainerWidth,
                        height: 105,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.moduleCount,
                          itemBuilder: (BuildContext context, int index) {
                            /*
                            Makes graphicModule decrease in size as more
                            modules are being displayed
                             */
                            if (widget.moduleCount > 6) {
                              widget.containerWidth = 113;
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
                                    height: 1.5,
                                  ),
                                  makeGraphicModuleAttachment(
                                    index + 1,
                                    widget.containerWidth / 6,
                                    widget.moduleCount,
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: <Widget>[
                                  makeGraphicModuleAttachment(
                                    index + 1,
                                    widget.containerWidth / 6,
                                    widget.moduleCount,
                                  ),
                                  SizedBox(
                                    height: 1.5,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget makeGraphicModule(int modNum, double containerWidth, int moduleCount) {
    if (modNum == 1 && modNum == moduleCount) {
      //If it's the first and only module
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
      //If it's the first module
      return Container(
        padding: EdgeInsets.only(
          left: 15,
        ),
        width: containerWidth * 1.15,
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
      //If it's not the first and second module
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
      //If it's the last module
      return Container(
        padding: EdgeInsets.only(
          right: 15,
        ),
        width: containerWidth * 1.15,
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

  Widget makeGraphicModuleAttachment(
      int modNum, double containerWidth, int moduleCount) {
    //If it's the first and only module
    if (modNum == 1 && modNum == moduleCount) {
      return SizedBox(
        height: 50,
      );
    } else if (modNum == 1 && modNum != moduleCount) {
      //If it's the first module and not the only module
      return Row(
        children: <Widget>[
          SizedBox(
            width: containerWidth * 5.9,
          ),
          Container(
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
          ),
        ],
      );
    } else if (modNum.isEven && modNum != moduleCount ||
        modNum.isOdd && modNum != moduleCount) {
      //If it's not the first or last module
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
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
            ),
            SizedBox(
              width: containerWidth * 4,
            ),
            Container(
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
            ),
          ],
        ),
      );
    } else if (modNum == moduleCount) {
      //If it's the last module
      return Row(
        children: <Widget>[
          Container(
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
          ),
          SizedBox(
            width: containerWidth * 5.9,
          ),
        ],
      );
    }
  }
}
