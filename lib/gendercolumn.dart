import 'package:flutter/material.dart';

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
        SizedBox(
          height: 15,
        ),
        Text(
          genderText,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
