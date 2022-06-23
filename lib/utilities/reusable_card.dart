import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Color specificColor;

  ReusableCard({required this.cardChild, required this.specificColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: specificColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
