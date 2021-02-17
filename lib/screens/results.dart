import 'package:bmi_calculator/widgets/bottombutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/reusable_card.dart';
import '../widgets/round_icon_button.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretaion});

  final String bmiResult;
  final String resultText;
  final String interpretaion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Your Result',
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              card_color: KActive_cardColor,
              card_child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: KResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: KBmiTextStyle,
                    ),
                    Text(
                      interpretaion,
                      textAlign: TextAlign.center,
                      style: KBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            buttontitle: 'RECALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
