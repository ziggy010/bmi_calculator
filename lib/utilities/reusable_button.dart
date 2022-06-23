import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final IconData specificIconBtn;
  final VoidCallback onTap;
  ReusableButton({required this.specificIconBtn, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: Color(0xFF111427),
      child: Icon(
        specificIconBtn,
        color: Colors.white,
      ),
    );
  }
}
