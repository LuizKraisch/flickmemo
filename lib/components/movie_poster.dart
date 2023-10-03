import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/original/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg'),
            fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.background.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3)),
        ],
      ),
    );
  }
}
