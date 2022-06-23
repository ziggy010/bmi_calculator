import 'package:flutter/material.dart';

import '../constants.dart';

class IconContainer extends StatelessWidget {
  final IconData specificIcon;
  final String specificText;

  IconContainer({required this.specificIcon, required this.specificText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          specificIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          specificText,
          style: kSubtitleTextStyle,
        ),
      ],
    );
  }
}
