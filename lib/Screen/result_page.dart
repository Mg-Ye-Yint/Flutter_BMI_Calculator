import 'package:bmi_calculator/Function/ReuseableBox.dart';
import 'package:bmi_calculator/Function/cardChildBuilder.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';

class Resultpage extends StatelessWidget {
  Resultpage(
      {required this.score, required this.status, required this.feedback});

  final String status;
  final String score;
  final String feedback;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(
            child: Text(
          'BMI CALCULATION       ',
          style: Kappbarfontstyle,
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Text(
                'Your Result',
                style: Kresultfontstyle,
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: ReuseableBox(
                color: KsecondColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      status,
                      style: Kstatusfontstyle,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Your BMI Score',
                      style: KBMIfontstyle,
                    ),
                    Text(
                      score,
                      style: KBMInumberfontstyle,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      feedback,
                      style: Kfeedbackfontstyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          Bottombutton(
            buttontext: 'RECALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
