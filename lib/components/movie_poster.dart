import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/pages/movie_page.dart';
import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;
  final FlickmemoUser? currentFlickmemoUser;

  const MoviePoster({
    super.key,
    required this.movie,
    required this.currentFlickmemoUser,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePage(
              movieId: movie.id,
              currentFlickmemoUser: currentFlickmemoUser,
            ),
          ),
        );
      },
      child: Container(
        width: 110,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
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
      ),
    );
  }
}
