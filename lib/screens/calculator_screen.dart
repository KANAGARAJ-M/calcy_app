// lib/screens/calculator_screen.dart

import 'package:flutter/material.dart';
import 'mobile_calculator_screen.dart';
import 'tablet_calculator_screen.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileCalculatorScreen();
        } else {
          return TabletCalculatorScreen();
        }
      },
    );
  }
}
