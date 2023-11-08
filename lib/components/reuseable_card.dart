import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard(
      {required this.reuseableCColor,
      required this.cardChild,
      required this.isTapped});
  final Color reuseableCColor;
  final Widget cardChild;
  final Function isTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isTapped(),
      child: Card(
        color: reuseableCColor,
        margin: const EdgeInsets.all(15),
        child: SizedBox.expand(child: cardChild),
      ),
    );
  }
}
