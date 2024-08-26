// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/calculator_screen.dart';
import 'screens/currency_converter_screen.dart';
import 'screens/notes_screen.dart';
import 'screens/android_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator & Tools',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/calculator': (context) => CalculatorScreen(),
        '/currency-converter': (context) => CurrencyConverterScreen(),
        '/notes': (context) => NotesScreen(),
        '/android-details': (context) => AndroidDetailsScreen(),
      },
    );
  }
}
