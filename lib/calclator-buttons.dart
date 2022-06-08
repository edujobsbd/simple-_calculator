import 'package:calculattor_1/calculator_button.dart';
import 'package:flutter/cupertino.dart';
import 'calculator_row.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';



class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({required this.onTap});

  final CalculatorButtonsTapCallback onTap;
  final calculatorButtonRows = [
    ['7', '8', '9', Calculations.DIVIDER],
    ['4', '5', '6', Calculations.MULTIPLY],
    ['1', '2', '3', Calculations.SUBTRACT],
    [Calculations.DOT, '0', '00', Calculations.ADD],
    [Calculations.CLEAR, Calculations.EQUAL]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: calculatorButtonRows.map((calculatorRowButtons) {
          return CalculatorRow(
            buttons: calculatorRowButtons,
            onTap: onTap,
          );
        }).toList()
    );
  }
}



