import 'package:calculattor_1/calculator_button.dart';
import 'package:flutter/cupertino.dart';

class CalculatorRow extends StatelessWidget {
  CalculatorRow({required this.buttons,required this.onTap});
  final List<String> buttons;
  final CalculatorButtonsTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children :rowButton(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  List<Widget> rowButton(){
    List<Widget> allButtons = [];
    buttons.forEach(
        (String buttonText){
         allButtons.add(
           CalculatorButton(
             text: buttonText,
             onTap : onTap,
           ),
         );
        }
    );

    return allButtons;
  }
}
