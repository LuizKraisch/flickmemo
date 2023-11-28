import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.currentIndex,
    required this.totalItems,
  });

  final int currentIndex;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: 0,
          end: currentIndex.toDouble(),
        ),
        builder: (context, value, _) => LinearProgressIndicator(
          minHeight: 8,
          value: value / totalItems,
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.outline),
        ),
      ),
    );
  }
}
