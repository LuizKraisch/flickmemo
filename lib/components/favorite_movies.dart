import 'package:flickmemo/components/error_info.dart';
import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      UserService userService = UserService();
      final result =
          await userService.getFavoriteMovies(widget.currentFlickmemoUser);
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
        Text(
          t.profilePage.favoriteMovies.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
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
                  return Center(
                    child: ErrorInfo(errorMessage: snapshot.error.toString()),
                  );
                } else {
                  final movies = snapshot.data ?? [];
                  if (movies.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.solidStar, size: 40),
                          SizedBox(height: 10),
                          Text(
                            t.profilePage.favoriteMovies.empty,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
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
                    );
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
