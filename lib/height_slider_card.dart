import 'package:flutter/material.dart';

import 'constants.dart';

class HeightSliderCard extends StatelessWidget {
  final int height;
  final Function onSlide;

  HeightSliderCard({this.height, this.onSlide});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Text(
            'Height',
            style: kLabelTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              '$height',
              style: kNumberTextStyle,
            ),
            Text(
              ' cm',
              style: kLabelTextStyle,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              thumbColor: Color(0xFFEB1555),
              overlayColor: Color(0x29EB1555),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 15.0,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 30.0,
              ),
            ),
            child: Slider(
              value: height.toDouble(),
              min: 120.0,
              max: 220.0,
              inactiveColor: Color(0xFF8D8E98),
              onChanged: (double newValue) {
                onSlide(newValue);
              },
            ),
          ),
        )
      ],
    ));
  }
}
