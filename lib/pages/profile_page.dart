import 'package:flickmemo/components/error_info.dart';
import 'package:flickmemo/components/favorite_movies.dart';
import 'package:flickmemo/components/profile_header.dart';
import 'package:flickmemo/components/grid_movies.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfilePage extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const ProfilePage({
    this.currentFlickmemoUser,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FlickmemoUser? currentFlickmemoUser;
  Future<List<Movie>>? favoriteMoviesFuture;
  Future<List<Movie>>? recentMoviesFuture;
  Future<List<Movie>>? watchlistMoviesFuture;

  int recentMoviesCount = 0;
  int watchlistMoviesCount = 0;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
    favoriteMoviesFuture = fetchFavoriteMovies();
    recentMoviesFuture = fetchRecentMovies();
    watchlistMoviesFuture = fetchWatchlistMovies();
  }

  Future<List<Movie>> fetchFavoriteMovies() async {
    try {
      UserService userService = UserService();
      final result =
          await userService.getFavoriteMovies(widget.currentFlickmemoUser);
      return result;
    } catch (error) {
      throw Exception('Failed to find movie data.');
    }
  }

  Future<List<Movie>> fetchRecentMovies() async {
    try {
      UserService userService = UserService();
      final result =
          await userService.getRecentMovies(widget.currentFlickmemoUser);
      recentMoviesCount = result.length;
      return result;
    } catch (error) {
      throw Exception('Failed to find movie data.');
    }
  }

  Future<List<Movie>> fetchWatchlistMovies() async {
    try {
      UserService userService = UserService();
      final result =
          await userService.getWatchlistMovies(widget.currentFlickmemoUser);
      watchlistMoviesCount = result.length;
      return result;
    } catch (error) {
      throw Exception('Failed to find movie data.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 160,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ProfileHeader(currentFlickmemoUser: currentFlickmemoUser),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: RefreshIndicator(
          onRefresh: () {
            return Future.wait([
              fetchFavoriteMovies(),
              fetchRecentMovies(),
              fetchWatchlistMovies(),
            ]).then((result) {
              setState(() {
                favoriteMoviesFuture = Future.value(result[0]);
                recentMoviesFuture = Future.value(result[1]);
                watchlistMoviesFuture = Future.value(result[2]);
              });
            }).catchError((error) {
              throw Exception('Failed to find movie info.');
            });
          },
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                t.profilePage.favoriteMovies.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 170,
                child: FutureBuilder<List<Movie>>(
                  future: favoriteMoviesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: LoadingAnimationWidget.fourRotatingDots(
                        color: Theme.of(context).colorScheme.primary,
                        size: 50.0,
                      ));
                    } else if (snapshot.hasError) {
                      return Center(
                        child:
                            ErrorInfo(errorMessage: snapshot.error.toString()),
                      );
                    } else {
                      return FavoriteMovies(
                        currentFlickmemoUser: currentFlickmemoUser,
                        movies: snapshot.data,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 5),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                      labelColor: Theme.of(context).colorScheme.background,
                      unselectedLabelColor: Colors.grey,
                      indicatorWeight: 0.0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.all(5.0),
                      tabs: [
                        Tab(text: t.profilePage.body.tabs.recents),
                        Tab(text: t.profilePage.body.tabs.watchlist),
                      ],
                    ),
                    SizedBox(
                      height: recentMoviesCount != 0
                          ? ((recentMoviesCount / 3).ceil() * 200.0)
                          : 400,
                      child: TabBarView(
                        children: [
                          SizedBox(
                            height: recentMoviesCount != 0
                                ? ((recentMoviesCount / 3).ceil() * 200.0)
                                : 400,
                            child: Scrollbar(
                              child: FutureBuilder<List<Movie>>(
                                future: fetchRecentMovies(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final movies = snapshot.data ?? [];
                                    if (movies.isEmpty) {
                                      return Center(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 80.0),
                                            Icon(FontAwesomeIcons.solidClock,
                                                size: 40.0),
                                            SizedBox(height: 10.0),
                                            Text(
                                              t.profilePage.recentMovies.empty,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return GridMovies(
                                        currentFlickmemoUser:
                                            currentFlickmemoUser,
                                        movies: snapshot.data,
                                      );
                                    }
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: ErrorInfo(
                                          errorMessage:
                                              snapshot.error.toString()),
                                    );
                                  } else {
                                    return Center(
                                        child: LoadingAnimationWidget
                                            .fourRotatingDots(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 50.0,
                                    ));
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: watchlistMoviesCount != 0
                                ? ((watchlistMoviesCount / 3).ceil() * 200.0)
                                : 400,
                            child: Scrollbar(
                              child: FutureBuilder<List<Movie>>(
                                future: fetchWatchlistMovies(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final movies = snapshot.data ?? [];
                                    if (movies.isEmpty) {
                                      return Center(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 80.0),
                                            Icon(FontAwesomeIcons.solidClock,
                                                size: 40.0),
                                            SizedBox(height: 10.0),
                                            Text(
                                              t.profilePage.recentMovies.empty,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return GridMovies(
                                        currentFlickmemoUser:
                                            currentFlickmemoUser,
                                        movies: snapshot.data,
                                      );
                                    }
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: ErrorInfo(
                                          errorMessage:
                                              snapshot.error.toString()),
                                    );
                                  } else {
                                    return Center(
                                        child: LoadingAnimationWidget
                                            .fourRotatingDots(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 50.0,
                                    ));
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
