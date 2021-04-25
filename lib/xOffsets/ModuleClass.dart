class Module {
  String label;
  int moduleValue;
  int incrementAmt;

  Module({this.label, this.moduleValue, this.incrementAmt});

  @override
  String get getModuleLabel => this.label;
  int get getModuleValue => this.moduleValue;

  int add() {
    this.moduleValue += incrementAmt;
    return this.moduleValue;
  }

  int subtract() {
    this.moduleValue -= incrementAmt;
    return this.moduleValue;
  }
}
