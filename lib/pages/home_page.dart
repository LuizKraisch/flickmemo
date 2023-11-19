import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flickmemo/components/error_info.dart';
import 'package:flickmemo/components/home_page_header.dart';
import 'package:flickmemo/components/movie_card.dart';
import 'package:flickmemo/components/progress_bar.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const HomePage({
    this.currentFlickmemoUser,
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int totalItems = 20;
  FlickmemoUser? currentFlickmemoUser;
  Future<List<Movie>>? _moviesFuture;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
    _moviesFuture = _fetchDiscoverMovies();
  }

  Future<List<Movie>> _fetchDiscoverMovies() async {
    try {
      MovieService movieService = MovieService();
      final result =
          await movieService.getDiscoverMovies(widget.currentFlickmemoUser);
      return result;
    } catch (error) {
      throw Exception('Failed to find movie data.');
    }
  }

  void handleDiscoverReload() {
    setState(() {
      currentIndex = 0;
      _moviesFuture = _fetchDiscoverMovies();
    });
  }

  bool allCardsSwapped() {
    return currentIndex == totalItems;
  }

  void onSwap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void handleAddWatchlist(String movieId) async {
    MovieService movieService = MovieService();
    await movieService.addMovieToWatchlist(movieId, currentFlickmemoUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          SizedBox(height: 70),
          HomePageHeader(
              profilePhotoURL: currentFlickmemoUser?.photoURL ?? '',
              onProfileTap: () => Scaffold.of(context).openDrawer()),
          SizedBox(height: 10),
          Column(children: [
            SizedBox(height: 10),
            Text(
              t.homePage.title(name: currentFlickmemoUser!.firstName),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              t.homePage.subtitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            width: MediaQuery.of(context).size.width * 0.95,
            child: FutureBuilder<List<Movie>>(
              future: _moviesFuture,
              builder: (context, snapshot) {
                totalItems = snapshot.data?.length ?? 20;
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Icon(FontAwesomeIcons.film, size: 40),
                          SizedBox(height: 10),
                          Text(
                            t.homePage.movieCards.empty,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Stack(
                      children: [
                        AppinioSwiper(
                          cardsCount: movies.length,
                          onSwipe: (index, AppinioSwiperDirection direction) {
                            if (direction == AppinioSwiperDirection.right) {
                              handleAddWatchlist(movies[index - 1].id);
                            }
                            onSwap(index);
                          },
                          swipeOptions: AppinioSwipeOptions.only(
                            left: true,
                            right: true,
                          ),
                          cardsBuilder: (BuildContext context, int index) {
                            return MovieCard(
                                movie: movies[index],
                                currentFlickmemoUser: currentFlickmemoUser);
                          },
                        ),
                        if (allCardsSwapped())
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),
                                Icon(FontAwesomeIcons.clapperboard, size: 40),
                                SizedBox(height: 10),
                                Text(
                                  t.homePage.movieCards.noMoreMovies.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                SizedBox(height: 3),
                                Text(
                                  t.homePage.movieCards.noMoreMovies.subtitle,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 5),
                                ElevatedButton(
                                  onPressed: () => handleDiscoverReload(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0), // Rounded corners
                                    ),
                                  ),
                                  child: Text(
                                    'Recarregar',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff1D1F24),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    );
                  }
                }
              },
            ),
          ),
          ProgressBar(currentIndex: currentIndex, totalItems: totalItems),
        ],
      ),
    );
  }
}
