import 'package:math_expressions/math_expressions.dart';

// initialize parser to evaluate string

String valueToCalulate = "0";

String screenValue = "";

void calculate(value) {
  if (valueToCalulate == "0") {
    valueToCalulate = value;
  } else if (value == "AC") {
    screenValue = "";
    valueToCalulate = "0";
  } else if (value == "C") {
    valueToCalulate = "0";
  } else if (double.tryParse(value) != null) {
    valueToCalulate += value;
  } else if (value == "=") {
    Parser parser = Parser();
    ContextModel cm = ContextModel();
    var uservalue = valueToCalulate.replaceAll('X', '*');
    var parsedExp = parser.parse(uservalue);
    screenValue = parsedExp.evaluate(EvaluationType.REAL, cm).toString();
  } else if (value == "DEL") {
    valueToCalulate = valueToCalulate.substring(0, valueToCalulate.length - 1);
  } else {
    valueToCalulate += value;
  }
  if (screenValue.contains(".0")) {
    var thisValue = screenValue.substring(0, screenValue.length - 2);
    screenValue = thisValue;
  }
}
