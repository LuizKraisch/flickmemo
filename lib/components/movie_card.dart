import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondary,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.background.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3)),
        ],
      ),
      child: Text(
        'Omgggg this is a movie!',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
