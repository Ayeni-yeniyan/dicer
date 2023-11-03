import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gendercolumn.dart';
import 'reuseable_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const double bottomContainerHeight = 80;
const Color cardColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    reuseableCColor: cardColor,
                    cardChild: GenderColumn(
                      genderText: 'MALE',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    reuseableCColor: cardColor,
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
            reuseableCColor: cardColor,
            cardChild: SizedBox(),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReuseableCard(
                  reuseableCColor: cardColor,
                  cardChild: SizedBox(),
                )),
                Expanded(
                    child: ReuseableCard(
                  reuseableCColor: cardColor,
                  cardChild: SizedBox(),
                )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
            color: bottomContainerColor,
            child: Center(
                child: Text(
              'CALCULATE BMI',
              style: TextStyle(fontSize: 30),
            )),
          )
        ],
      ),
    );
  }
}
