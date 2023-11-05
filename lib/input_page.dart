import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gendercolumn.dart';
import 'reuseable_card.dart';
import 'bottom_content.dart';

const double bottomContainerHeight = 80;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const Color bottomContainerColor = Color(0xFFEB1555);

enum GenderType { male, female, unknown }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColor = inactiveCardColor;
Color femaleCardColor = inactiveCardColor;
GenderType male = GenderType.male;
GenderType female = GenderType.female;
GenderType gender = GenderType.unknown;
int weight = 50;
int age = 20;
int height = 100;

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = GenderType.male;
                      });
                    },
                    child: ReuseableCard(
                      reuseableCColor: gender == GenderType.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: GenderColumn(
                        genderText: 'MALE',
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = GenderType.female;
                      });
                    },
                    child: ReuseableCard(
                      reuseableCColor: gender == GenderType.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: GenderColumn(
                        genderText: 'FEMALE',
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              reuseableCColor: activeCardColor,
              cardChild: ReuseableCard(
                reuseableCColor: activeCardColor,
                cardChild: BottomContent(
                  label: 'HEIGHT',
                  category: height,
                  additionalWidget: Slider(
                      max: 200,
                      activeColor: Colors.white,
                      inactiveColor: Color(0xFF8D8E98),
                      thumbColor: bottomContainerColor,
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      }),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    reuseableCColor: activeCardColor,
                    cardChild: BottomContent(
                        label: 'WEIGHT',
                        category: weight,
                        additionalWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(
                                Icons.remove_circle_outline_outlined,
                                size: 60,
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(
                                Icons.add_circle_outline_outlined,
                                size: 60,
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    reuseableCColor: activeCardColor,
                    cardChild: BottomContent(
                      label: 'AGE',
                      category: age,
                      additionalWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: const Icon(
                              Icons.remove_circle_outline_outlined,
                              size: 60,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: const Icon(
                              Icons.add_circle_outline_outlined,
                              size: 60,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
            color: bottomContainerColor,
            child: const Center(
              child: Text(
                'CALCULATE BMI',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
