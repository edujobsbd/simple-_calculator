import 'number-formatter.dart';

class Calculations{
  static const DOT='.';
  static const MULTIPLY='*';
  static const SUBTRACT='-';
  static const ADD='+';
  static const DIVIDER='/';
  static const CLEAR='CLEAR';
  static const EQUAL='=';
  static const OPERATIONS=[
    Calculations.ADD,
    Calculations.MULTIPLY,
    Calculations.SUBTRACT,
    Calculations.DIVIDER,
  ];
  
  static double add(double a, double b,)=>a+b;
  static double subtract(double a, double b,)=>a-b;
  static double divider(double a, double b,)=>a/b;
  static double multiply(double a, double b,)=>a+b;
  
}
class Calculator{
  static parseString(String text){
    List<String> numbersToAdd;
    double a,b,result;
    if(text.contains(Calculations.ADD)){
      numbersToAdd = text.split(Calculations.ADD);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.add(a, b);
    }
    else if(text.contains(Calculations.MULTIPLY)){
      numbersToAdd = text.split(Calculations.MULTIPLY);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.multiply(a, b);
    }
    else if(text.contains(Calculations.DIVIDER)){
      numbersToAdd = text.split(Calculations.DIVIDER);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.divider(a, b);
    }
    else if(text.contains(Calculations.SUBTRACT)){
      numbersToAdd = text.split(Calculations.SUBTRACT);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.subtract(a, b);
    }
    else {
      return text;
    }

    return NumberFormatter.format(result.toString());
  }

  static String addPeriod(String calaulatorString) {
    if(calaulatorString.isEmpty){
      return calaulatorString = '0&{Calculations.DOT}';
    }

    RegExp exp = RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(calaulatorString);
    int maxMatches = Calculator.includesOperation(calaulatorString)?2:1;

    return matches.length == maxMatches
        ?calaulatorString:calaulatorString += Calculations.DOT;
  }
  static bool includesOperation(String calculatorString){
    for (var operation in Calculations.OPERATIONS){
      if (calculatorString.contains(operation)){
        return true;
      }
    }
    return false;
  }
}