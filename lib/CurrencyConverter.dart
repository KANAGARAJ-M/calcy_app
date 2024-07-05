import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  String fromCurrency = "USD";
  String toCurrency = "EUR";
  double rate = 0.0;

  @override
  void initState() {
    super.initState();
    _getExchangeRate();
  }

  _getExchangeRate() async {
    final response = await http.get(
        Uri.parse('https://api.exchangerate-api.com/v4/latest/$fromCurrency'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        rate = data['rates'][toCurrency];
      });
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }

  _convert() {
    double input = double.parse(fromController.text);
    double output = input * rate;
    toController.text = output.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: fromController,
          decoration: InputDecoration(labelText: 'Amount in $fromCurrency'),
          keyboardType: TextInputType.number,
        ),
        DropdownButton<String>(
          value: fromCurrency,
          items: <String>['USD', 'EUR', 'GBP', 'INR'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              fromCurrency = newValue!;
              _getExchangeRate();
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: _convert,
        ),
        TextField(
          controller: toController,
          decoration: InputDecoration(labelText: 'Amount in $toCurrency'),
          readOnly: true,
        ),
        DropdownButton<String>(
          value: toCurrency,
          items: <String>['USD', 'EUR', 'GBP', 'INR'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              toCurrency = newValue!;
              _getExchangeRate();
            });
          },
        ),
      ],
    );
  }
}
