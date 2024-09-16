// lib/screens/currency_converter_screen.dart

import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatelessWidget {
  const CurrencyConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
      ),
      body: const Center(
        child: Text("Currency Converter Screen"),
      ),
    );
  }
}
