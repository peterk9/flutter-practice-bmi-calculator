import 'package:flutter/material.dart';
import 'constants.dart';

class WeightTrackerCard extends StatelessWidget {
  final int increaseWeight = 1;
  final int decreaseWeight = -1;
  final int weight;
  final Function onPress;

  WeightTrackerCard({this.weight, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Weight',
            style: kLabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                '$weight',
                style: kNumberTextStyle,
              ),
              Text(
                ' lbs',
                style: kLabelTextStyle,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RoundIconButton(
                icon: Icon(Icons.arrow_downward),
                onPress: () {
                  onPress(increaseWeight);
                },
              ),
              RoundIconButton(
                icon: Icon(Icons.arrow_upward),
                onPress: () {
                  onPress(decreaseWeight);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
