import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.ontap, @required this.buttontitle});

  final Function ontap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(child: Text(buttontitle, style: KLargeButton_TextStyle)),
        color: KBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: KBottomContainerHeight,
      ),
    );
  }
}
