import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dicer/components/reuseable_card.dart';
import 'package:dicer/constants.dart';

class OutputPage extends StatelessWidget {
  OutputPage(
      {required this.bmi, required this.interpretation, required this.range});

  final String bmi;
  final Text range;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 30,
                bottom: 15,
              ),
              child: Text(
                'Your Result',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReuseableCard(
              isTapped: () {},
              reuseableCColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  range,
                  const SizedBox(height: 10),
                  Text(
                    bmi,
                    style: kResultNumStyle,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Normal BMI range:',
                    style: kLabelTextStyle,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '18.1 - 25 kg/m2',
                    style: kTextStyle,
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      interpretation,
                      style: kTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kInactiveCardColor.withOpacity(0.5),
                        foregroundColor: Colors.white,
                        fixedSize: const Size(250, 80),
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w200,
                            wordSpacing: 1.5),
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text: 'My BMI result is $bmi kg/m2.'));
                      },
                      child: const Text(
                        'SAVE RESULT',
                      ))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              color: kBottomContainerColor,
              child: const Center(
                child: Text(
                  'RE-CALCULATE YOUR BMI',
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
