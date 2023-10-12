import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/movie_service.dart';
import 'package:flutter/material.dart';

class FavoriteMovies extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const FavoriteMovies({super.key, this.currentFlickmemoUser});

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  Future<List<Movie>>? _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = _fetchFavoriteMovies();
  }

  Future<List<Movie>> _fetchFavoriteMovies() async {
    try {
      MovieService movieService = MovieService();
      final result =
          await movieService.getFavoriteMovies(widget.currentFlickmemoUser);
      return result;
    } catch (error) {
      throw Exception('Failed to find movie data.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Favorite Movies",
            style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 15),
        SizedBox(
          height: 170,
          child: Scrollbar(
            child: FutureBuilder<List<Movie>>(
              future: _moviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final movies = snapshot.data ?? [];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: movies.map((movie) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: MoviePoster(movie: movie),
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
