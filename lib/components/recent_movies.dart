import 'package:flickmemo/components/error_info.dart';
import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
        Text(
          t.profilePage.recentMovies.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 3),
        Text(
          t.profilePage.recentMovies.subtitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: _moviesCount != 0 ? ((_moviesCount / 3).ceil() * 200.0) : 400,
          child: Scrollbar(
            child: FutureBuilder<List<Movie>>(
              future: _moviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 50.0,
                  ));
                } else if (snapshot.hasError) {
                  return Center(
                    child: ErrorInfo(errorMessage: snapshot.error.toString()),
                  );
                } else {
                  final movies = snapshot.data ?? [];
                  if (movies.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(height: 80.0),
                          Icon(FontAwesomeIcons.solidClock, size: 40.0),
                          SizedBox(height: 10.0),
                          Text(
                            t.profilePage.recentMovies.empty,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                      child: GridView.count(
                        padding: EdgeInsets.only(top: 15.0),
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount: 3,
                        children: movies.map((movie) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 10.0, bottom: 10.0),
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
