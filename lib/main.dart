import 'package:flutter/material.dart';
import 'Screen/calculator.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: inputPage(),
    );
  }
}
