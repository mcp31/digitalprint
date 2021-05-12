import 'package:flutter/material.dart';
import 'ModuleClass.dart';

class Head {
  int numberOfModules;
  List<Module> moduleList = []; //dynamic growing list
  int deltaValue;

  Head({this.numberOfModules, this.moduleList, this.deltaValue});

  //function to add delta and iterate through the list of modules within the head
  void addDelta(int deltaValue) {
    int temp;

    //Checking difference between new and old delta values
    if (this.deltaValue != null) {
      temp = deltaValue;
      deltaValue = deltaValue - this.deltaValue;
      this.deltaValue = temp;
    } else {
      this.deltaValue = deltaValue;
    }

    for (final i in moduleList) {
      i.moduleValue += deltaValue;
    }
  }
}
