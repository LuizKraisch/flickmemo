import 'package:flickmemo/models/movie.dart';
import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;

  const MoviePoster({
    super.key,
    required this.movie,
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
                'https://www.themoviedb.org/t/p/original/${movie.posterPath}'),
            fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.background.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3)),
        ],
      ),
      child: Text(movie.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
