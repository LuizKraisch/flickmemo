import 'package:flickmemo/components/movie_box.dart';
import 'package:flickmemo/components/search_header.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPage extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;

  const SearchPage({
    this.currentFlickmemoUser,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int totalItems = 20;
  MovieService movieService = MovieService();
  FlickmemoUser? currentFlickmemoUser;
  Future<List<Movie>>? _moviesFuture;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;
    _moviesFuture = _fetchTrendingMovies();
  }

  Future<List<Movie>> _fetchTrendingMovies() async {
    try {
      MovieService movieService = MovieService();
      final result =
          await movieService.getTrendingMovies(widget.currentFlickmemoUser);
      return result;
    } catch (error) {
      throw Exception('Failed to find movie data.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          floating: true,
          expandedHeight: 130,
          flexibleSpace: FlexibleSpaceBar(background: SearchHeader()),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Trending Movies",
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 3),
                  Text("Get in touch with the latest releases.",
                      style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(height: 15),
                  SizedBox(
                    height: totalItems * 210,
                    child: FutureBuilder<List<Movie>>(
                      future: _moviesFuture,
                      builder: (context, snapshot) {
                        totalItems = snapshot.data?.length ?? 20;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 80.0),
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
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
                                  Text("There are no movies to show",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium),
                                ],
                              ),
                            );
                          } else {
                            return ListView.builder(
                              padding: EdgeInsets.only(top: 0),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                return MovieBox(
                                  movie: movies[index],
                                  currentFlickmemoUser: currentFlickmemoUser,
                                );
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
