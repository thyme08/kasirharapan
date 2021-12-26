import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget childCard;
  const ReusableCard({required this.childCard});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 180,
      child: childCard,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
      ),
    );
  }
}
