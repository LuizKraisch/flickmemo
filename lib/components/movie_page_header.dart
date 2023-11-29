import 'dart:ui';
import 'package:flickmemo/env.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/services/formatters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoviePageHeader extends StatelessWidget {
  final Movie? movie;

  const MoviePageHeader({
    this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
          image: NetworkImage('$tmdbImagesUrl/${movie?.backdropPath}'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 180,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image:
                          NetworkImage('$tmdbImagesUrl/${movie!.posterPath}'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3)),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                movie?.title as String,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 5.0),
              Text(
                "${formatMovieReleaseYear(movie?.releaseDate as String)} • ${movie?.genres.join(', ')}",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              movie?.tagline == ""
                  ? Container()
                  : Text(
                      movie?.tagline as String,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
              const SizedBox(height: 5.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(FontAwesomeIcons.solidStar,
                        color: Theme.of(context).colorScheme.scrim, size: 20),
                    SizedBox(width: 5),
                    Text(
                      formatFloat(movie!.voteAverage),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      movie?.status as String,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Container(
                    width: 90,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      movie?.originalLanguage.toUpperCase() as String,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Container(
                    width: 90,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      formatRuntime(movie?.runtime as String),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
