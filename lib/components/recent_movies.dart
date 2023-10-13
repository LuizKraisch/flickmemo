import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecentMovies extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const RecentMovies({super.key, this.currentFlickmemoUser});

  @override
  State<RecentMovies> createState() => _RecentMoviesState();
}

class _RecentMoviesState extends State<RecentMovies> {
  Future<List<Movie>>? _moviesFuture;
  late int _moviesCount = 2;

  @override
  void initState() {
    super.initState();
    _moviesFuture = _fetchRecentMovies();
  }

  Future<List<Movie>> _fetchRecentMovies() async {
    try {
      UserService userService = UserService();
      final result =
          await userService.getRecentMovies(widget.currentFlickmemoUser);
      _moviesCount = result.length;
      return result;
    } catch (error) {
      throw Exception('Failed to find movie data.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.7;
    final double itemWidth = size.width / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent Movies",
            style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 15),
        SizedBox(
          height: (_moviesCount * 200),
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
                  if (movies.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Icon(FontAwesomeIcons.film, size: 40),
                          SizedBox(height: 10),
                          Text("There are no recent movies",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Text("Start watching!",
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: GridView.count(
                        padding: EdgeInsets.only(top: 15),
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount: 3,
                        children: movies.map((movie) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: MoviePoster(movie: movie),
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
