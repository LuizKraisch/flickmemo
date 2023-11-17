import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flutter/material.dart';

class FavoriteMovies extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;
  final List<Movie>? movies;

  const FavoriteMovies({super.key, this.currentFlickmemoUser, this.movies});

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    movies = widget.movies ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 170,
          child: Scrollbar(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies.map((movie) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: MoviePoster(
                    movie: movie,
                    currentFlickmemoUser: widget.currentFlickmemoUser,
                  ),
                );
              }).toList(),
            ),
          )),
        ),
      ],
    );
  }
}
