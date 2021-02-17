import 'package:flutter/material.dart';

class card_gender extends StatelessWidget {
  final Icon icon_gender;
  final Text text_gender;
  card_gender({@required this.icon_gender, @required this.text_gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon_gender,
        SizedBox(
          height: 15.0,
        ),
        text_gender,
      ],
    );
  }
}
