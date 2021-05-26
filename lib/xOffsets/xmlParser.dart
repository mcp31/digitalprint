import 'dart:io';
import 'package:xml/xml.dart';
import 'dart:math';

class SysTypeParser {
  var myfile;
  XmlDocument document;
  void setFile(String fileName) {
    myfile = new File(fileName);
  }

  SysTypeParser(String fileName) {
    setFile(fileName);
    document = XmlDocument.parse(myfile.readAsStringSync());
  }

  XmlElement getSysTypeElem() {
    XmlElement tempElem;
    var testNode = document.rootElement;
    Iterable<XmlElement> childNodes = testNode.findAllElements('SYS_Type');
    for (var elem in childNodes) {
      var nodeattributes = elem.attributes;
      final testStr = nodeattributes.first.value;
      if (testStr.contains('*')) {
        tempElem = elem;
      }
    }
    return tempElem;
  }

  List<String> getSysTypes() {
    //final document = XmlDocument.parse(myfile.readAsStringSync());
    var testNode = document.rootElement;
    Iterable<XmlElement> sysTypesAvail = testNode.findAllElements('SYS_Type');
    List<String> sysList = [];
    for (var elem in sysTypesAvail) {
      var nodeattributes = elem.attributes;
      final testStr = nodeattributes.first.value;
      if (testStr.contains('*')) {
        sysList.add(nodeattributes.first.value.replaceAll('*', ''));
      } else {
        sysList.add(nodeattributes.first.value);
      }
    }
    return sysList;
  }

  setSysType(String sysType) {
    //final document = XmlDocument.parse(myfile.readAsStringSync());
    var testNode = document.rootElement;
    Iterable<XmlElement> childNodes = testNode.findAllElements('SYS_Type');
    for (var elem in childNodes) {
      var nodeattributes = elem.attributes;
      final testStr = nodeattributes.first.value;
      if (testStr.contains('*')) {
        //clear all *
        nodeattributes.first.value = testStr.replaceAll('*', '');
      }
      if (nodeattributes.first.value == sysType) {
        //if sysType add back *
        nodeattributes.first.value = nodeattributes.first.value + '*';
      }
    }
    myfile.writeAsStringSync(document.toString());
    //myfile.writeAsStringSync();
  }

  List<int> getXoffsets() {
    List<String> sysList = [];
    var elem = getSysTypeElem();
    Iterable<XmlElement> offsetNodes = elem.findAllElements('xOffset');
    for (var offsets in offsetNodes) {
      sysList.add(offsets.text);
    }
    List<int> tempList = sysList.map(int.parse).toList();
    return tempList;
  }

  setXoffsets(List<String> sysList) {
    //final document = XmlDocument.parse(myfile.readAsStringSync());
    var testNode = document.rootElement;
    Iterable<XmlElement> sysTypesAvail = testNode.findAllElements('SYS_Type');
    for (var elem in sysTypesAvail) {
      var nodeattributes = elem.attributes;
      final testStr = nodeattributes.first.value;
      if (testStr.contains('*')) {
        Iterable<XmlElement> offsetNodes = elem.findAllElements('xOffset');
        int i = 0;
        for (var offsets in offsetNodes) {
          offsets.innerText = sysList.elementAt(i);
          i++;
        }
      }
    }
    myfile.writeAsStringSync(document.toString());
  }

  List<dynamic> getModuleCount() {
    var elem = getSysTypeElem();
    List<dynamic> modList = [];
    Iterable<XmlElement> headNodes = elem.findAllElements('Head');
    for (var head in headNodes) {
      Iterable<XmlElement> modNodes = head.findAllElements('Module');
      modList.add(modNodes.length);
    }
    return modList;
  }

  int getDpi() {
    var elem = getSysTypeElem();
    Iterable<XmlElement> dpiNode = elem.findElements('DPI');
    return int.parse(dpiNode.first.text);
  }

  int getPrintWidth() {
    var elem = getSysTypeElem();
    Iterable<XmlElement> dpiNode = elem.findElements('Width');
    return int.parse(dpiNode.first.text);
  }

  int getBitsPerPixel() {
    var elem = getSysTypeElem();
    Iterable<XmlElement> bitsperpixelnode = elem.findElements('BitsPerPixel');
    return int.parse(bitsperpixelnode.first.text);
  }

  int getPicoliter() {
    var elem = getSysTypeElem();
    Iterable<XmlElement> picoliternodes = elem.findAllElements('PicoLiter');
    for (var picnodes in picoliternodes) {
      var nodeValue = picnodes.getAttribute('Set');
      if (nodeValue != null) {
        if (nodeValue.contains('*')) {
          return int.parse(picnodes.text);
        }
      }
    }
  }

  int getXDpi() {
    var elem = getSysTypeElem();
    Iterable<XmlElement> testnodes = elem.findAllElements('xDpi');
    for (var testnode in testnodes) {
      var nodeValue = testnode.getAttribute('Set');
      if (nodeValue != null) {
        if (nodeValue.contains('*')) {
          return int.parse(testnode.text);
        }
      }
    }
  }

  int getKilohertz() {
    var elem = getSysTypeElem();
    Iterable<XmlElement> testnode = elem.findElements('Kilohertz');
    return int.parse(testnode.first.text);
  }

  int getPCCCount() {
    var elem = getSysTypeElem();
    Iterable<XmlElement> pccNodes = elem.findAllElements('PCC');
    return pccNodes.length;
  }

  //
  List<int> getPccMultipliers() {
    var elem = getSysTypeElem();
    List<int> multilist = [];
    Iterable<XmlElement> testnodes = elem.findAllElements('PCC');
    for (var testnode in testnodes) {
      Iterable<XmlElement> childtestnode = testnode.findElements('Master');
      if (childtestnode.first.text == '1') {
        multilist.add(200); //always 200 for now
        return multilist;
      }
    }
  }

  List<int> getPccDividers(int dpi) {
    var elem = getSysTypeElem();
    List<int> MultiList = [];
    Iterable<XmlElement> testnodes = elem.findAllElements('PCC');
    for (var testnode in testnodes) {
      Iterable<XmlElement> childtestnode = testnode.findElements('Master');
      if (childtestnode.first.text == '1') {
        Iterable<XmlElement> secondchildtestnode =
            testnode.findElements('EncoderPPI');
        int encoderValue = int.parse(secondchildtestnode.first.text);
        double dencoderValue = (encoderValue / dpi) * 200;
        encoderValue = dencoderValue.round();
        MultiList.add(encoderValue);
        return MultiList;
      }
    }
  }

  List<int> getPccHeadCounts() {
    var elem = getSysTypeElem();
    List<int> multilist = [];
    Iterable<XmlElement> testnodes = elem.findAllElements('PCC');
    for (var testnode in testnodes) {
      Iterable<XmlElement> childtestnode = testnode.findElements('Module');
      multilist.add(childtestnode.length);
    }
    return multilist;
  }
}
