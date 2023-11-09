import 'package:flickmemo/components/bottom_movie_page.dart';
import 'package:flickmemo/components/movie_page_body.dart';
import 'package:flickmemo/components/movie_page_header.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/services/movie_service.dart';
import 'package:flickmemo/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoviePage extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;
  final String movieId;

  const MoviePage({
    required this.currentFlickmemoUser,
    required this.movieId,
    Key? key,
  }) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieService movieService = MovieService();
  FlickmemoUser? currentFlickmemoUser;
  Map<String, dynamic>? movieData;
  bool isWatchlistLoading = false;
  bool addedToWatchlist = false;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;

    movieService
        .getMovieInfo(widget.movieId, currentFlickmemoUser)
        .then((result) {
      setState(() {
        movieData = result;
        addedToWatchlist = movieData?["addedToUserWatchlist"] ?? false;
      });
    }).catchError((error) {
      throw Exception('Failed to find movie info.');
    });
  }

  void handleWatchlist() {
    setState(() {
      isWatchlistLoading = true;
    });

    addedToWatchlist ? removeFromWatchlist() : addToWatchlist();
  }

  void addToWatchlist() async {
    UserService userService = UserService();
    userService
        .addMovieToWatchlist(movieData?["data"].id, currentFlickmemoUser)
        .then((result) {
      setState(() {
        addedToWatchlist = true;
        isWatchlistLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isWatchlistLoading = false;
      });
      throw Exception('Failed to handle watchlist.');
    });
  }

  void removeFromWatchlist() async {
    UserService userService = UserService();
    userService
        .removeMovieFromWatchlist(movieData?["data"].id, currentFlickmemoUser)
        .then((result) {
      setState(() {
        addedToWatchlist = false;
        isWatchlistLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isWatchlistLoading = false;
      });
      throw Exception('Failed to handle watchlist.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: movieData != null
          ? BottomMoviePage(
              movie: movieData?["data"],
              review: movieData?["userReview"],
              currentFlickmemoUser: currentFlickmemoUser)
          : SizedBox(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: movieData != null
          ? CustomScrollView(slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                leading: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(139, 60, 60, 60),
                      child: IconButton(
                        icon: isWatchlistLoading
                            ? Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2.0),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : addedToWatchlist
                                ? const Icon(FontAwesomeIcons.solidBookmark,
                                    size: 20, color: Colors.white)
                                : const Icon(FontAwesomeIcons.bookmark,
                                    size: 20, color: Colors.white),
                        onPressed: () => handleWatchlist(),
                      ),
                    ),
                  ),
                ],
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  background: MoviePageHeader(movie: movieData?["data"]),
                ),
              ),
              SliverToBoxAdapter(
                child: MoviePageBody(
                  movieData: movieData,
                  currentFlickmemoUser: currentFlickmemoUser,
                ),
              )
            ])
          : Center(
              child: SpinKitSquareCircle(
                color: Theme.of(context).colorScheme.primary,
                size: 50.0,
              ),
            ),
    );
  }
}
