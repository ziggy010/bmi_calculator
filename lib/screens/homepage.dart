import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/utilities/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utilities/calculator_brain.dart';
import '../utilities/reusable_button.dart';

import '../utilities/icon_container.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

enum GenderType {
  male,
  female,
}

class _HomePageState extends State<HomePage> {
  int height = 190;
  int weight = 60;
  int age = 18;

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  var buttonTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonTapped = GenderType.male;
                      });
                    },
                    child: ReusableCard(
                      specificColor: buttonTapped == GenderType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContainer(
                        specificIcon: FontAwesomeIcons.male,
                        specificText: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonTapped = GenderType.female;
                      });
                    },
                    child: ReusableCard(
                      specificColor: buttonTapped == GenderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContainer(
                        specificIcon: FontAwesomeIcons.female,
                        specificText: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              specificColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kSubtitleTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBigLetterText,
                      ),
                      Text(
                        'cm',
                        style: kSubtitleTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade700,
                      trackHeight: 1.0,
                      thumbColor: kBottomBarColor,
                      overlayColor: Color(0x29EA1456),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    specificColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kSubtitleTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigLetterText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableButton(
                              specificIconBtn: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ReusableButton(
                              specificIconBtn: FontAwesomeIcons.add,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    specificColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kSubtitleTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigLetterText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableButton(
                              specificIconBtn: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ReusableButton(
                              specificIconBtn: FontAwesomeIcons.add,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return MyResult(
                      bmiValue: calc.calculateBmi(),
                      status: calc.getStatus(),
                      suggestions: calc.getSuggestion(),
                    );
                  }),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: kBottomBarColor,
              height: 80,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
