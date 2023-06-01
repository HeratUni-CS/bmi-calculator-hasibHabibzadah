import 'dart:io';
import 'package:bmi/Screens/result_page.dart';
import 'package:bmi/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import '../Components/reusable_widget.dart';
import '../constant.dart';
import '../Components/bottom_button.dart';
import '../Components/round_icon_button.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 175;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableWidget(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  color: (selectedGender == Gender.Male)
                      ? kActivCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                    iconData: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
                ReusableWidget(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  color: (selectedGender == Gender.Female)
                      ? kActivCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                    iconData: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ],
            ),
          ),
          ReusableWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 1,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF888993),
                    thumbColor: Color(0XFFEB1555),
                    overlayColor: Color(0x27EB1555),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                    min: 120,
                    max: 210,
                  ),
                ),
              ],
            ),
            color: kActivCardColor,
          ),
          Expanded(
            child: Row(
              children: [
                ReusableWidget(
                  color: kActivCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            iconData: Icons.remove,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RoundIconButton(
                              iconData: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                ),
                ReusableWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: kLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            iconData: Icons.remove,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RoundIconButton(
                              iconData: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                  color: kActivCardColor,
                ),
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              BMIBrain bmiBrain = BMIBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      result: bmiBrain.getResult(),
                      bmi: bmiBrain.getBMI(),
                      interpretation: bmiBrain.getInterpretation(),
                    );
                  },
                ),
              );
            },
            label: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}
