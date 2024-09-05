import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors
                .white, 
            fontSize: 40,
            letterSpacing: 2.2,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
