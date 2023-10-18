import 'package:flickmemo/components/movie_page_body.dart';
import 'package:flickmemo/components/movie_page_header.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/services/movie_service.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;

    movieService
        .getMovieInfo(widget.movieId, currentFlickmemoUser)
        .then((result) {
      setState(() {
        movieData = result;
      });
    }).catchError((error) {
      throw Exception('Failed to find movie info.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: movieData != null
          ? CustomScrollView(slivers: [
              SliverAppBar(
                leading: IconButton(
                    icon: Icon(FontAwesomeIcons.arrowLeft),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                backgroundColor: Color.fromARGB(105, 88, 47, 254),
                floating: true,
                expandedHeight: 500,
                flexibleSpace:
                    FlexibleSpaceBar(background: MoviePageHeader(movie: movieData?["data"])),
              ),
              SliverToBoxAdapter(
                child: MoviePageBody(movieData: movieData),
              )
            ])
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
