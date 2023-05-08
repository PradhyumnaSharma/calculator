import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}

//
class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  //variables

  double firstNum = 0.0;
  double secondNum = 0.0;
  var Input = '';
  var Output = '';
  var operation = '';
  var hideInput = false;
  var OutputSize = 34.0;

  OnButtonClick(value) {
    // print(value);
    //if value is AC
    if (value == "AC") {
      Input = '';
      Output = '';
    } else if (value == "<") {
      if (Input.isNotEmpty) {
        Input = Input.substring(0, Input.length - 1);
      }
    } else if (value == "=") {
      if (Input.isNotEmpty) {
        var userInput = Input;
        userInput = Input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        Output = finalValue.toString();
        if (Output.endsWith(".0")) {
          Output = Output.substring(0, Output.length - 2);
        }
        Input = Output;
        hideInput = true;
        OutputSize = 52;
      }
    } else if (value == "Don't click me") {
      // hideInput = true;
      Output = "Told you not to click😑";
    } else {
      Input = Input + value;
      hideInput = false;
      OutputSize = 34;
    }
    ;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            // color: Colors.red,
            child: Column(
                //
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : Input,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Output,
                    style: TextStyle(
                      fontSize: OutputSize,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  //
                  SizedBox(
                    height: 30,
                  )
                ]),
          )),
          //buttons
          Row(
            children: [
              button(
                  text: "AC", buttonBgColor: buttonColor, tColor: orangeColor),
              button(
                  text: '<', buttonBgColor: operatorColor, tColor: orangeColor),
              button(
                  text: "Don't click me",
                  buttonBgColor: operatorColor,
                  tColor: orangeColor),
              button(
                  text: '/', buttonBgColor: operatorColor, tColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: '8'),
              button(text: '9'),
              button(
                  text: 'x', buttonBgColor: operatorColor, tColor: orangeColor),
            ],
          ),


          Row(
            children: [
              button(text: "4"),
              button(text: '5'),
              button(text: '6'),
              button(
                  text: '-', buttonBgColor: operatorColor, tColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: '2'),
              button(text: '3'),
              button(
                  text: '+', buttonBgColor: operatorColor, tColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "%", tColor: orangeColor),
              button(text: '0'),
              button(text: '.'),
              button(
                  text: '=',
                  buttonBgColor: Colors.orange,
                  tColor: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tColor, buttonBgColor = Colors.orange}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(22),
          ),
          onPressed: () => OnButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: tColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
