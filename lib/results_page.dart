import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('wagwon'),
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
