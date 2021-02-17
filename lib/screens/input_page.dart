import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/reusable_card.dart';
import '../widgets/icon_content.dart';
import '../constants.dart';
import '../widgets/round_icon_button.dart';
import 'results.dart';
import '../widgets/bottombutton.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color male_cardColor = KInactive_cardColor;
  Color female_cardColor = KActive_cardColor;
  GenderType selected_gender;
  int height = 180;
  int weight = 70;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selected_gender = GenderType.male;
                      });
                    },
                    card_color: selected_gender == GenderType.male
                        ? KActive_cardColor
                        : KInactive_cardColor,
                    card_child: card_gender(
                      icon_gender: Icon(FontAwesomeIcons.mars, size: 80.0),
                      text_gender: Text(
                        'MALE',
                        style: KLabel_Text_style,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selected_gender = GenderType.female;
                      });
                    },
                    card_color: selected_gender == GenderType.female
                        ? KActive_cardColor
                        : KInactive_cardColor,
                    card_child: card_gender(
                      icon_gender: Icon(FontAwesomeIcons.venus, size: 80.0),
                      text_gender: Text(
                        'FEMALE',
                        style: KLabel_Text_style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              card_color: KActive_cardColor,
              card_child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: KNum_Text_style,
                      ),
                      Text(
                        'cm',
                        style: KLabel_Text_style,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: KMin_height,
                      max: KMax_height,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    card_color: KActive_cardColor,
                    card_child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: KLabel_Text_style,
                        ),
                        Text(
                          weight.toString(),
                          style: KNum_Text_style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              ontapped: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              ontapped: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    card_color: KActive_cardColor,
                    card_child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: KLabel_Text_style,
                        ),
                        Text(
                          age.toString(),
                          style: KNum_Text_style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              ontapped: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              ontapped: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttontitle: 'CALCULATE',
            ontap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Result(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretaion: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
