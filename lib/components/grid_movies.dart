import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flutter/material.dart';

class GridMovies extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;
  final List<Movie>? movies;

  const GridMovies({super.key, this.currentFlickmemoUser, this.movies});

  @override
  State<GridMovies> createState() => _GridMoviesState();
}

class _GridMoviesState extends State<GridMovies> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    movies = widget.movies ?? [];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.7;
    final double itemWidth = size.width / 2;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
      child: GridView.count(
        padding: EdgeInsets.only(top: 15.0),
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 3,
        children: movies.map((movie) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
            child: MoviePoster(
              movie: movie,
              currentFlickmemoUser: widget.currentFlickmemoUser,
            ),
          );
        }).toList(),
      ),
    );
  }
}
