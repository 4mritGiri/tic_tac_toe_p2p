import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color startColor;
  final Color endColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: NiceButtons(
        gradientOrientation: GradientOrientation.Horizontal,
        startColor: startColor,
        endColor: endColor,
        borderColor: const Color(0xff9023e8),
        borderRadius: 32,
        stretch: false,
        onTap: (finish) {
          onTap();
        },
        child: Text(
          title,
          style:
              textTheme.headlineMedium?.copyWith(color: Colors.white, shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4,
              offset: const Offset(0, 5),
            ),
          ]),
        ),
      ),
    );
  }
}
