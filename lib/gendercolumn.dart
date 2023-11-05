import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

class GenderColumn extends StatelessWidget {
  GenderColumn({required this.genderText, required this.genderIcon});
  final String genderText;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          genderText,
          style: labelTextStyle,
        )
      ],
    );
  }
}
