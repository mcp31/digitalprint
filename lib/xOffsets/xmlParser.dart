import 'dart:io';
import 'package:xml/xml.dart';

class SysTypeParser {
  var myfile;

  void setFile(String fileName) {
    myfile = new File(fileName);
  }

  SysTypeParser(String fileName) {
    setFile(fileName);
  }

  List<String> getSysTypes() {
    final document = XmlDocument.parse(myfile.readAsStringSync());
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
    final document = XmlDocument.parse(myfile.readAsStringSync());
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
    final document = XmlDocument.parse(myfile.readAsStringSync());
    var testNode = document.rootElement;
    Iterable<XmlElement> childNodes = testNode.findAllElements('SYS_Type');
    List<String> sysList = [];
    for (var elem in childNodes) {
      var nodeattributes = elem.attributes;
      final testStr = nodeattributes.first.value;
      if (testStr.contains('*')) {
        Iterable<XmlElement> offsetNodes = elem.findAllElements('xOffset');
        for (var offsets in offsetNodes) {
          sysList.add(offsets.text);
        }
      }
    }
    List<int>tempList = sysList.map(int.parse).toList();
    return tempList;
  }

  setXoffsets(List<String> sysList) {
    final document = XmlDocument.parse(myfile.readAsStringSync());
    var testNode = document.rootElement;
    Iterable<XmlElement> childNodes = testNode.findAllElements('SYS_Type');
    for (var elem in childNodes) {
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
    //myfile.writeAsStringSync();
  }

  List<dynamic> getModuleCount() {
    {
      final document = XmlDocument.parse(myfile.readAsStringSync());
      var testNode = document.rootElement;
      Iterable<XmlElement> childNodes = testNode.findAllElements('SYS_Type');
      List<dynamic> modList = [];
      for (var elem in childNodes) {
        var nodeattributes = elem.attributes;
        final testStr = nodeattributes.first.value;
        if (testStr.contains('*')) {
          Iterable<XmlElement> headNodes = elem.findAllElements('Head');
          for (var head in headNodes) {
            Iterable<XmlElement> modNodes = head.findAllElements('Module');
            modList.add(modNodes.length);
          }
        }
      }
      return modList;
    }
  }
}
