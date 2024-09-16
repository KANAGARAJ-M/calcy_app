// lib/screens/mobile_calculator_screen.dart

import 'package:flutter/material.dart';

class MobileCalculatorScreen extends StatefulWidget {
  const MobileCalculatorScreen({super.key});

  @override
  _MobileCalculatorScreenState createState() => _MobileCalculatorScreenState();
}

class _MobileCalculatorScreenState extends State<MobileCalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        child: Text(buttonText),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator (Mobile)"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
