import 'dart:js';

import 'package:calculattor_1/calclator-buttons.dart';
import 'package:calculattor_1/history_page.dart';
import 'package:calculattor_1/number-display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculator.dart';
import 'calculator_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';
  






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed:(){
                _navigateAndDidplayHistory(context);
              },
              icon: Icon(Icons.history)
          )
        ],
      ),
      body: Column(
        children:[
          NumberDisplay(value: calculatorString,),
          CalculatorButtons(onTap:_onPressed),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  _navigateAndDidplayHistory(BuildContext context)async{
    context;
    MaterialPageRoute(builder: (context)=> History(operations: calculations));

    if(result!=null){
      setState(() {
        isNewEquation = false;
        calculatorString= Calculator.parseString(result);
        
      });
    }



  }

  void _onPressed(){
    if(Calculations.OPERATIONS.contains(buttonText)){
      return setState(() {
        operations.add(buttonText);
        calculatorString+='$buttonText';

      });
    }
    // On CLEAR press
    if (buttonText == Calculations.CLEAR) {
      return setState(() {
        operations.add(Calculations.CLEAR);
        calculatorString = "";
      });
    }

    // On Equals press
    if (buttonText == Calculations.EQUAL) {
      String newCalculatorString = Calculator.parseString(calculatorString);

      return setState(() {
        if (newCalculatorString != calculatorString) {
          // only add evaluated strings to calculations array
          calculations.add(calculatorString);
        }

        operations.add(Calculations.EQUAL);
        calculatorString = newCalculatorString;
        isNewEquation = false;
      });
    }

    if (Text == Calculations.DOT) {
      return setState(() {
        calculatorString = Calculator.addPeriod(calculatorString);
      });
    }

    setState(() {
      if (!isNewEquation
          && operations.length > 0
          && operations.last == Calculations.EQUAL
      ) {
        calculatorString = buttonText;
        isNewEquation = true;
      } else {
        calculatorString += Text;
      }
    });
  }
}
