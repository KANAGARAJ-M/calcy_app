import 'package:flutter/material.dart';
import 'calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator & Currency Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.currency_exchange,
                semanticLabel: 'Currency Converter',
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(child: Calculator()),
          // Divider(height: 1),
          // Expanded(child: CurrencyConverter()),
        ],
      ),
    );
  }
}
