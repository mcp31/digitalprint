import 'package:ini/ini.dart';
import 'dart:io';

//standard file io open file hardcoded path to ini file.
//File file = new File("C:\\dpi\\sw\\printerInfo.ini");

//file path in mac for printerinfo.ini
File file = new File(
    "/Users/maryplana/Desktop/Projects/OpconfigRewrite/printerinfo.ini");

//config ini.dart class load from the file
void writeSettingsFile(String section, String option, String value) {
  Config config = new Config.fromStrings(file.readAsLinesSync());
  //config method set the value
  config.set(section, option, value);
  file.writeAsStringSync(config.toString());
}

String readSettingsFile(String section, String option) {
  Config config = new Config.fromStrings(file.readAsLinesSync());
  //config get a value
  return config.get(section, option);
}
