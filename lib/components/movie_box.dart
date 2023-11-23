import 'package:flickmemo/env.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/pages/movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieBox extends StatelessWidget {
  final Movie movie;
  final FlickmemoUser? currentFlickmemoUser;

  const MovieBox({
    super.key,
    required this.movie,
    required this.currentFlickmemoUser,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePage(
              movieId: movie.id,
              currentFlickmemoUser: currentFlickmemoUser,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage('$tmdbImagesUrl/${movie.backdropPath}'),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3)),
            ],
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [Colors.transparent, Colors.black],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 200.0,
                              maxWidth: 260.0,
                              minHeight: 30.0,
                              maxHeight: 100.0,
                            ),
                            child: Text(
                              movie.title,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.calendar,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      DateTime.parse(movie.releaseDate)
                                          .year
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  "•",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(width: 5.0),
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.fire,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      movie.popularity,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.solidStar,
                              color: Theme.of(context).colorScheme.scrim,
                              size: 20),
                          SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              double.parse(double.parse(movie.voteAverage)
                                      .toStringAsFixed(1))
                                  .toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
