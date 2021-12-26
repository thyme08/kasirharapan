import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const RoundIconButton({required this.icon, required this.onPressed});
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}
