import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchResultsPage extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const SearchResultsPage({
    Key? key,
    this.currentFlickmemoUser,
  }) : super(key: key);

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  FlickmemoUser? currentFlickmemoUser;
  bool firstOpen = true;
  Future<List<Movie>>? _moviesFuture;
  List<Movie> movies = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _moviesFuture = null;
  }

  Future<List<Movie>> fetchMoviesByQuery(String query) async {
    try {
      MovieService movieService = MovieService();
      final result = await movieService.getMovieBySearch(
          query, widget.currentFlickmemoUser);
      return result;
    } catch (error) {
      throw Exception('Failed to find movie data.');
    }
  }

  void handleSearch(String query) {
    setState(() {
      _moviesFuture = fetchMoviesByQuery(query);
      firstOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.7;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leadingWidth: 35.0,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: SizedBox(
          height: 45.0,
          child: SearchInput(
            searchQuery: searchQuery,
            onSubmitted: handleSearch,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Icon(FontAwesomeIcons.circleExclamation, size: 40),
                      SizedBox(height: 10),
                      Text(
                        t.homePage.movieCards.error,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text('${snapshot.error}'),
                    ],
                  ),
                );
              } else {
                movies = snapshot.data ?? [];
                if (movies.isEmpty) {
                  if (firstOpen == true) {
                    return SizedBox();
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Icon(FontAwesomeIcons.triangleExclamation, size: 40),
                          SizedBox(height: 10),
                          Text(
                            t.searchPage.body.empty,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: GridView.count(
                      padding: EdgeInsets.only(top: 15),
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 3,
                      children: movies.map((movie) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, bottom: 10.0),
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
    );
  }
}

class SearchInput extends StatefulWidget {
  final String searchQuery;
  final Function(String) onSubmitted;

  const SearchInput({
    Key? key,
    required this.searchQuery,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final FocusNode inputFocusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.searchQuery;
    inputFocusNode.requestFocus();
  }

  @override
  void dispose() {
    inputFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 2.0),
        child: Center(
          child: TextField(
            controller: _textController,
            onSubmitted: (value) {
              widget.onSubmitted(value);
            },
            maxLines: null,
            focusNode: inputFocusNode,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => widget.onSubmitted(_textController.text),
                icon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Color.fromARGB(130, 255, 255, 255),
                  size: 15,
                ),
              ),
              border: InputBorder.none,
              hintText: 'La La Land, WALL-E, Spider-Man...',
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                color: Color.fromARGB(130, 255, 255, 255),
                fontWeight: FontWeight.w400,
              ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
