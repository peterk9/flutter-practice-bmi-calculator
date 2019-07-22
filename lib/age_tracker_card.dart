import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class AgeTrackerCard extends StatelessWidget {
  final int increaseAge = 1;
  final int decreaseAge = -1;
  final int age;
  final Function onPress;

  AgeTrackerCard({this.age, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'Age',
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              '$age',
              style: kNumberTextStyle,
            ),
            Text(
              ' yrs',
              style: kLabelTextStyle,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              icon: Icon(FontAwesomeIcons.minus),
              onPress: () {
                onPress(decreaseAge);
              },
            ),
            RoundIconButton(
              icon: Icon(FontAwesomeIcons.plus),
              onPress: () {
                onPress(increaseAge);
              },
            )
          ],
        )
      ],
    ));
  }
}
