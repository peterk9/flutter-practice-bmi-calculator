import 'package:flutter/material.dart';

const Color kActiveColor = Color(0xFF1D1E33);
const Color kInActiveColor = Color(0xFF111328);
const Color kBottomContainerColour = Color(0xFFEB1555);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w100,
);

class RoundIconButton extends StatelessWidget {
  final Function onPress;
  final Icon icon;

  RoundIconButton({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFFEB1555),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

enum RoutesEnum { home, results }

const kRoutes = <RoutesEnum, String>{
  RoutesEnum.home: '/',
  RoutesEnum.results: '/results'
};
