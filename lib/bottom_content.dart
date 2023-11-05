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
        Text(
          label,
          style: const TextStyle(
            fontSize: 25,
            color: Color(0xFF8D8E98),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$category',
          style: const TextStyle(fontSize: 70),
        ),
        const SizedBox(height: 15),
        additionalWidget,
      ],
    );
  }
}
