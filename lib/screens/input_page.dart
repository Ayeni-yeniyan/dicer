import 'package:dicer/components/calculate_bmi.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/components/reuseable_card.dart';
import 'output_page.dart';
import '/components/gendercolumn.dart';
import '/components/bottom_content.dart';
import '/components/icon_row.dart';
import '/constants.dart';

enum GenderType { male, female, unknown }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColor = kInactiveCardColor;
Color femaleCardColor = kInactiveCardColor;
GenderType male = GenderType.male;
GenderType female = GenderType.female;
GenderType gender = GenderType.unknown;
int weight = 50;
int age = 20;
int height = 100;

double bmi = weight / (height * height / 10000);

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    isTapped: () {
                      setState(() {
                        gender = GenderType.male;
                      });
                    },
                    reuseableCColor: gender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderColumn(
                      genderText: 'MALE',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    isTapped: () {
                      setState(() {
                        gender = GenderType.female;
                      });
                    },
                    reuseableCColor: gender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderColumn(
                      genderText: 'FEMALE',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              isTapped: () {},
              reuseableCColor: kActiveCardColor,
              cardChild: MiddleContent(
                label: 'HEIGHT',
                category: height,
                additionalWidget: Slider(
                    max: 250,
                    activeColor: Colors.white,
                    inactiveColor: Color(0xFF8D8E98),
                    thumbColor: kBottomContainerColor,
                    value: height.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    }),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    isTapped: () {},
                    reuseableCColor: kActiveCardColor,
                    cardChild: BottomContent(
                      label: 'WEIGHT',
                      category: weight,
                      additionalWidget: IconRow(
                        increment: () {
                          setState(() {
                            weight++;
                          });
                        },
                        decrement: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    isTapped: () {},
                    reuseableCColor: kActiveCardColor,
                    cardChild: BottomContent(
                      label: 'AGE',
                      category: age,
                      additionalWidget: IconRow(
                        increment: () {
                          setState(() {
                            age++;
                          });
                        },
                        decrement: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculateBMI calc = CalculateBMI(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OutputPage(
                          bmi: calc.getBMI(),
                          interpretation: calc.interpretation(),
                          range: calc.range(),
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              color: kBottomContainerColor,
              child: const Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
