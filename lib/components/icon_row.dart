import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  IconRow({required this.increment, required this.decrement});
  final Function increment;
  final Function decrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => decrement(),
          child: const Icon(
            Icons.remove_circle_outline_outlined,
            size: 60,
            color: Color(0xFF8D8E98),
          ),
        ),
        GestureDetector(
          onTap: () => increment(),
          child: const Icon(
            Icons.add_circle_outline_outlined,
            size: 60,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
