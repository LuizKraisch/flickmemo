import 'package:flickmemo/components/movie_page_body.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MoviePageBody should show the correct information',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MoviePageBody(
        currentFlickmemoUser: FlickmemoUser(
          internalID: '123',
          firstName: 'Test',
          lastName: 'User',
          photoURL: 'www.blank.com',
          createdAt: '2023-01-01',
        ),
        movieData: const {
          "data": Movie(
            id: '1',
            uuid: '321',
            title: 'Test Movie',
            overview: 'Test Overview',
            posterPath: 'www.blank.com',
            backdropPath: 'www.blank.com',
            releaseDate: '2023-01-01',
            voteAverage: '10',
            runtime: '114',
            genres: [],
            imdbID: '321',
            originalLanguage: '',
            popularity: '8000',
            status: 'Released',
            tagline: 'Test Tagline',
          ),
          "userReview": null,
          "externalReviews": [],
          "similarMovies": [],
        },
      ),
    ));

    expect(find.text(t.moviePage.body.overview.title), findsOneWidget);
    expect(find.text("Test Overview"), findsOneWidget);
    expect(find.text(t.moviePage.body.stats.popularity), findsOneWidget);
    expect(find.text("1h 54m"), findsOneWidget);
    expect(find.text(t.moviePage.body.stats.imdbLink), findsOneWidget);
    expect(find.text(t.moviePage.body.stats.releaseDate), findsOneWidget);
    expect(find.text("01/01/2023"), findsOneWidget);
    expect(find.text("01/01/2023"), findsOneWidget);
    expect(find.text(t.moviePage.body.reviews), findsOneWidget);
    expect(find.text(t.moviePage.body.similarMovies), findsOneWidget);
  });
}
