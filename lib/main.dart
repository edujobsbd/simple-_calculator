import 'dart:html';
import 'history_page.dart';
import 'package:calculattor_1/calclator-buttons.dart';
import 'package:calculattor_1/number-display.dart';
import 'package:flutter/material.dart';

import 'calculator.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: (){},
              icon:Icon(Icons.history))
        ],
      ),
      body: Column(
        children: [
          NumberDisplay(value: calculatorString,),
          CalculatorButtons(onTap: _onPressed),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),

    );
  }


  _navigateAndDisplayHistory(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => History(operations: calculations))
    );

    if (result != null) {
      setState(() {
        isNewEquation = false;
        calculatorString = Calculator.parseString(result);
      });
    }
  }

  void _onPressed({required String buttonText}) {
    // Standard mathematical operations
    if (Calculations.OPERATIONS.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText);
        calculatorString += " $buttonText ";
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

    if (buttonText == Calculations.DOT) {
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
        calculatorString += buttonText;
      }
    });
  }}
