import '../Screen/calculator.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class cardChildBulder extends StatelessWidget {
  cardChildBulder({this.icon, this.text});

  final IconData? icon;
  final String? text;

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon as IconData?,
          size: KiconSize,
        ),
        SizedBox(
          height: KcardChildSizeBoxHeight,
        ),
        Text(
          text as String,
          style: KlabelStyle,
        )
      ],
    );
  }
}
