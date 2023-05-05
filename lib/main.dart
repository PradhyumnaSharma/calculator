import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorss.dart';

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
                    "Input",
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Output",
                    style: TextStyle(
                      fontSize: 34,
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
                  text: "AC",
                  buttonBgColor: operatorColor,
                  tColor: orangeColor),
              button(
                  text: '<', buttonBgColor: operatorColor, tColor: orangeColor),
              button(text: '', buttonBgColor: Colors.transparent),
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
                  text: 'X', buttonBgColor: operatorColor, tColor: orangeColor),
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
                  text: '=', buttonBgColor: orangeColor, tColor: orangeColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tColor, buttonBgColor = Colors.orange, operatorColor}) {
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
          onPressed: () {},
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
