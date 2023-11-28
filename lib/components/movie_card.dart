import 'package:flickmemo/env.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/pages/movie_page.dart';
import 'package:flickmemo/services/formatters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final FlickmemoUser? currentFlickmemoUser;

  const MovieCard({
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
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              movie.posterPath.isNotEmpty
                  ? '$tmdbImagesUrl/${movie.posterPath}'
                  : 'https://wallpapers.com/images/featured/solid-grey-ew5fya1gh2bgc49b.jpg',
            ),
          ),
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
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 200.0,
                          maxWidth: 235.0,
                          minHeight: 30.0,
                          maxHeight: 100.0,
                        ),
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
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
                                  formatMovieReleaseYear(movie.releaseDate),
                                  style: Theme.of(context).textTheme.titleSmall,
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
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      movie.overview != ""
                          ? SizedBox(
                              width: 235.00,
                              height: 30.00,
                              child: Text(
                                movie.overview,
                                style: Theme.of(context).textTheme.titleMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.solidStar,
                              color: Theme.of(context).colorScheme.scrim,
                              size: 20),
                          SizedBox(width: 5),
                          Text(
                            movie.voteAverage == '0' ? '--' : movie.voteAverage,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
