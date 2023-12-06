import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String title;
  const CustomChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: textTheme.titleLarge?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
