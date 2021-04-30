import 'ModuleClass.dart';

class Head {
  int numberOfModules;
  List<Module> moduleList = []; //dynamic growing list
  int deltaValue;

  Head({this.numberOfModules, this.moduleList, this.deltaValue});
}
