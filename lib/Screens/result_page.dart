import 'package:bmi/Components/bottom_button.dart';
import 'package:bmi/constant.dart';
import 'package:bmi/Components/reusable_widget.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String bmi;
  String interpretation;

  ResultPage(
      {required this.result, required this.bmi, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BII Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReusableWidget(
            color: kActivCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
                Text(
                  result,
                  style: KResultTextStyle,
                ),
                Text(
                  bmi,
                  style: kBMITextStyle,
                ),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            label: 'RECALCULATE',
          ),
        ],
      ),
    );
  }
}
