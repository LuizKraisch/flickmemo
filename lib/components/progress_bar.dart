import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 22, 60, 0),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: 0,
          end: currentIndex.toDouble(),
        ),
        builder: (context, value, _) => LinearProgressIndicator(
          minHeight: 8,
          value: value / 10,
          backgroundColor: Color(0xff383C46),
          borderRadius: BorderRadius.circular(10),
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}