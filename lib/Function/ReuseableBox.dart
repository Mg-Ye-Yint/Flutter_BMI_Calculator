import '../Screen/calculator.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

enum sexType {
  netural,
  male,
  female,
}

class ReuseableBox extends StatelessWidget {
  ReuseableBox({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final Function? onPress;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress!();
      },
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(color: color),
        child: Center(
          child: cardChild, // Add some content here
        ),
      ),
    );
  }
}
