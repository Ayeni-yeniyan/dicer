import 'package:dicer/constants.dart';
import 'package:flutter/material.dart';

class BottomContent extends StatelessWidget {
  BottomContent(
      {required this.additionalWidget,
      required this.label,
      required this.category});

  final Widget additionalWidget;
  final String label;
  final int category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: kLabelTextStyle),
        const SizedBox(height: 5),
        Text(
          '$category',
          style: kNumberTextStyle,
        ),
        const SizedBox(height: 15),
        additionalWidget,
      ],
    );
  }
}

class MiddleContent extends StatelessWidget {
  MiddleContent(
      {required this.additionalWidget,
      required this.label,
      required this.category});

  final Widget additionalWidget;
  final String label;
  final int category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: kLabelTextStyle),
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
            text: '$category',
            style: kNumberTextStyle,
            children: const <TextSpan>[
              TextSpan(
                text: 'cm',
                style: kLabelTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        additionalWidget,
      ],
    );
  }
}
