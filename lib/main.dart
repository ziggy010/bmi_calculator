import 'package:flutter/material.dart';
import 'constants.dart';

import 'screens/homepage.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: kBackgroundColor),
      ),
      home: HomePage(),
    );
  }
}
