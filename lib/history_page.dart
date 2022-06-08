import 'dart:js';

import 'package:calculattor_1/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class History extends StatelessWidget {
  History({required this.operations});

  final List<String> operations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('History'),
        centerTitle: false,
      ),
      body: Center(
        child: _operationsList(operations),
      ),

    );
  }


  Widget _operationsList(List<String> operations){
    return ListView.builder(
        itemCount: operations.length,
        itemBuilder:(BuildContext context,int i){
          return ListTile(
            title: Text(operations[i]),
            onTap: (){
              Navigator.pop(context,operations[i]);
            },
            leading: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red.shade800,
                  width: 200
                ),
              borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                Calculator.parseString(operations[i]),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.all(5),
            ),
          );
        }
    );
  }
}
