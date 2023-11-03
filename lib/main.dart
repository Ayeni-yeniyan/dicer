import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme:
            AppBarTheme(backgroundColor: Color.fromARGB(255, 10, 13, 34)),
        scaffoldBackgroundColor: Color.fromARGB(255, 10, 13, 34),
      ),
      home: InputPage(),
    );
  }
}
