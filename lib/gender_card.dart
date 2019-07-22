import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { MALE, FEMALE }

class GenderCard extends StatelessWidget {
  final Gender gender;

  GenderCard({this.gender});

  IconData generateGenderIcon(Gender gender) {
    IconData iconData;
    if (gender == Gender.MALE) {
      iconData = FontAwesomeIcons.mars;
    } else if (gender == Gender.FEMALE) {
      iconData = FontAwesomeIcons.venus;
    }
    return iconData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          generateGenderIcon(this.gender),
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.gender.toString().split('.').last,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
