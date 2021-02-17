import 'package:flutter/material.dart';
import 'file:///C:/Users/Daniel/Downloads/Android_studio_proj/bmi-calculator-flutter/lib/screens/input_page.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.card_color, this.card_child, this.onPressed});
  final Color card_color;
  final Widget card_child;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: card_child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: card_color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
