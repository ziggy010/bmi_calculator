import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/utilities/calculator_brain.dart';
import 'package:bmi_calculator/utilities/reusable_card.dart';
import 'package:flutter/material.dart';

class MyResult extends StatelessWidget {
  final String status;
  final double bmiValue;
  final String suggestions;

  MyResult(
      {required this.status,
      required this.bmiValue,
      required this.suggestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 20.0),
            child: Text(
              'Your Result',
              style: kResultText,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    status,
                    style: kGreenText,
                  ),
                  Text(
                    bmiValue.toStringAsFixed(1),
                    style: kBmiText,
                  ),
                  Text(
                    suggestions,
                    textAlign: TextAlign.center,
                    style: kSuggestion,
                  ),
                ],
              ),
              specificColor: kActiveCardColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 80,
              color: kBottomBarColor,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'RE-CALCULATE YOUR BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
