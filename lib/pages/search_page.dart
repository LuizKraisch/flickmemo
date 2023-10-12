import 'package:flickmemo/components/movie_box.dart';
import 'package:flickmemo/components/search_header.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/movie_service.dart';
import 'package:flutter/material.dart';

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
  MovieService movieService = MovieService();
  FlickmemoUser? currentFlickmemoUser;
  List<Movie>? movies;

  @override
  void initState() {
    super.initState();
    currentFlickmemoUser = widget.currentFlickmemoUser;

    movieService.getTrendingMovies(currentFlickmemoUser).then((result) {
      setState(() {
        movies = result;
      });
    }).catchError((error) {
      throw Exception('Failed to find movie data.');
    });
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
                  SizedBox(height: 15),
                  SizedBox(
                    height:
                        ((movies?.isNotEmpty ?? false ? movies!.length : 10) *
                            210),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: movies?.length ?? 0,
                      itemBuilder: (context, index) {
                        return MovieBox(movie: movies![index]);
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
