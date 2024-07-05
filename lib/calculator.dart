import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
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
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "*") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
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
        // padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  Widget buildButtoncl1(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        // padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  Widget buildButtoncl2(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        // padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  Widget buildButtoncl3(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        // padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  Widget buildButtoncl4(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        // padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.indigo),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            child: Text(output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                )),
          ),
          Expanded(child: Divider()),
          // Expanded(child: Divider()),
          Column(
            children: [
              Row(children: [
                buildButtoncl1("7"),
                SizedBox(
                  width: 10,
                ),
                buildButtoncl1("8"),
                SizedBox(
                  width: 10,
                ),
                buildButtoncl1("9"),
                SizedBox(
                  width: 10,
                ),
                buildButton("/"),
                SizedBox(
                  width: 10,
                ),
              ]),
              SizedBox(
                height: 8,
              ),
              Row(children: [
                buildButtoncl2("4"),
                SizedBox(
                  width: 10,
                ),
                buildButtoncl2("5"),
                SizedBox(
                  width: 10,
                ),
                buildButtoncl2("6"),
                SizedBox(
                  width: 10,
                ),
                buildButton("*"),
                SizedBox(
                  width: 10,
                ),
              ]),
              SizedBox(
                height: 8,
              ),
              Row(children: [
                buildButtoncl3("1"),
                SizedBox(
                  width: 10,
                ),
                buildButtoncl3("2"),
                SizedBox(
                  width: 10,
                ),
                buildButtoncl3("3"),
                SizedBox(
                  width: 10,
                ),
                buildButton("-"),
                SizedBox(
                  width: 10,
                ),
              ]),
              SizedBox(
                height: 8,
              ),
              Row(children: [
                buildButtoncl4("."),
                SizedBox(
                  width: 10,
                ),
                buildButtoncl4("0"),
                SizedBox(
                  width: 10,
                ),
                buildButtoncl4("00"),
                SizedBox(
                  width: 10,
                ),
                buildButton("+"),
                SizedBox(
                  width: 10,
                ),
              ]),
              SizedBox(
                height: 8,
              ),
              Row(children: [
                buildButton("CLEAR"),
                SizedBox(
                  width: 20,
                ),
                buildButton("="),
                SizedBox(
                  width: 20,
                ),
              ]),
              SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
