import 'package:ini/ini.dart';
import 'dart:io';

//standard file io open file hardcoded path to ini file.
//File file = new File("C:\\dpi\\sw\\printerInfo.ini");

//file path in mac for printerinfo.ini
File printInfoFile = new File(
    "/Users/maryplana/Desktop/Projects/OpconfigRewrite/printerinfo.ini");

//file path in mac for winim.ini
File winimInfoFile =
    new File("/Users/maryplana/Desktop/Projects/OpconfigRewrite/winim.ini");

//config ini.dart class load from the file
//used for printerinfo.ini
void writeSettingsPrintFile(String section, String option, String value) {
  Config config = new Config.fromStrings(printInfoFile.readAsLinesSync());
  //config method set the value
  config.set(section, option, value);
  printInfoFile.writeAsStringSync(config.toString());
}

String readSettingsPrintFile(String section, String option) {
  Config config = new Config.fromStrings(printInfoFile.readAsLinesSync());
  //config get a value
  return config.get(section, option);
}

//used for winim.ini
void writeSettingsWinimFile(String section, String option, String value) {
  Config config = new Config.fromStrings(winimInfoFile.readAsLinesSync());
  //config method set the value
  config.set(section, option, value);
  winimInfoFile.writeAsStringSync(config.toString());
}

String readSettingsWinimFile(String section, String option) {
  Config config = new Config.fromStrings(winimInfoFile.readAsLinesSync());
  //config get a value
  return config.get(section, option);
}
