import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 17),
        SizedBox(width: 4),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
