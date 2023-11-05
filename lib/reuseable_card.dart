import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({required this.reuseableCColor, required this.cardChild});
  final Color reuseableCColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: reuseableCColor,
      margin: const EdgeInsets.all(15),
      child: SizedBox.expand(child: cardChild),
    );
  }
}
