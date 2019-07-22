import 'package:bmi_calculator/age_tracker_card.dart';
import 'package:bmi_calculator/height_slider_card.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/weight_tracker_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'gender_card.dart';
import 'reusable_card.dart';
import 'calculator_brian.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveColor;
  Color femaleCardColor = kInActiveColor;
  int height = 180;
  int weight = 180;
  int age = 20;
  Gender gender;

  void updateGender(Gender selectedGender) {
    if (selectedGender == Gender.MALE) {
      maleCardColor == kInActiveColor
          ? maleCardColor = kActiveColor
          : maleCardColor = kInActiveColor;
      maleCardColor == kActiveColor ? femaleCardColor = kInActiveColor : null;
      gender == null || gender == Gender.FEMALE
          ? gender = Gender.MALE
          : gender = null;
    } else if (selectedGender == Gender.FEMALE) {
      femaleCardColor == kActiveColor
          ? femaleCardColor = kInActiveColor
          : femaleCardColor = kActiveColor;
      femaleCardColor == kActiveColor ? maleCardColor = kInActiveColor : null;
      gender == null || gender == Gender.MALE
          ? gender = Gender.FEMALE
          : gender = null;
    }
  }

  void updateHeight(double newHeight) {
    height = newHeight.toInt();
  }

  void updateAge(int adjustment) {
    if (age > 0 && age < 110) age += adjustment;
  }

  void updateWeight(int adjustment) {
    if (weight > 50 && weight < 300) weight += adjustment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updateGender(Gender.MALE);
                      });
                    },
                    cardChild: GenderCard(gender: Gender.MALE),
                    color: maleCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updateGender(Gender.FEMALE);
                      });
                    },
                    cardChild: GenderCard(gender: Gender.FEMALE),
                    color: femaleCardColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveColor,
              cardChild: HeightSliderCard(
                height: height,
                onSlide: (newHeight) {
                  setState(() {
                    updateHeight(newHeight);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveColor,
                    cardChild: WeightTrackerCard(
                      weight: weight,
                      onPress: (adjustment) {
                        setState(() {
                          updateWeight(adjustment);
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveColor,
                    cardChild: AgeTrackerCard(
                      age: age,
                      onPress: (adjustment) {
                        setState(() {
                          updateAge(adjustment);
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            color: Color(0xFFEB1555),
            child: SizedBox(
              child: Center(
                child: Text(
                  'Calculate your BMI',
                  style: kLabelTextStyle,
                ),
              ),
              height: 80.0,
            ),
            onPressed: () {
              print('gender:$gender, age:$age, weight:$weight, height:$height');
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: calc.calculateBMI(),
                    bmiResult: calc.getResult(),
                    bmiInterpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
