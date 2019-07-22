import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    @required this.bmi,
    @required this.bmiResult,
    @required this.bmiInterpretation,
  });

  final String bmi;
  final String bmiResult;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Your Results',
                style: kLabelTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: ReusableCard(
              color: kActiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      '$bmiResult',
                      style: kLabelTextStyle,
                    ),
                  ),
                  Text(
                    '$bmi',
                    style: kNumberTextStyle,
                  ),
                  Text(
                    '$bmiInterpretation',
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  )
                ],
              ),
            ),
          ),
          FlatButton(
            color: Color(0xFFEB1555),
            child: SizedBox(
              child: Center(
                child: Text(
                  'Re-calculate',
                  style: kLabelTextStyle,
                ),
              ),
              height: 80.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
