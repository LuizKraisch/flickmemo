import 'package:flickmemo/models/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Movie', () {
    test('fromJson should create a Movie instance from JSON', () {
      final Map<String, dynamic> json = {
        'backdrop_path': '/path/to/backdrop.jpg',
        'genres': ['Action', 'Adventure'],
        'id': 123,
        'uuid': 'abc123',
        'imdb_id': 'tt1234567',
        'original_language': 'en',
        'overview': 'A great movie!',
        'popularity': 8.7,
        'poster_path': '/path/to/poster.jpg',
        'release_date': '2023-01-01',
        'runtime': 120,
        'status': 'Released',
        'tagline': 'Tagline here',
        'title': 'Awesome Movie',
        'vote_average': 9.2,
      };

      final movie = Movie.fromJson(json);

      expect(movie, isA<Movie>());
      expect(movie.backdropPath, '/path/to/backdrop.jpg');
      expect(movie.genres, ['Action', 'Adventure']);
      expect(movie.id, '123');
      expect(movie.uuid, 'abc123');
      expect(movie.imdbID, 'tt1234567');
      expect(movie.originalLanguage, 'en');
      expect(movie.overview, 'A great movie!');
      expect(movie.popularity, '8.7');
      expect(movie.posterPath, '/path/to/poster.jpg');
      expect(movie.releaseDate, '2023-01-01');
      expect(movie.runtime, '120');
      expect(movie.status, 'Released');
      expect(movie.tagline, 'Tagline here');
      expect(movie.title, 'Awesome Movie');
      expect(movie.voteAverage, '9.2');
    });

    test('fromJson should create a Movie instance with default values if optional fields are missing', () {
      final Map<String, dynamic> json = {
        'backdrop_path': '/path/to/backdrop.jpg',
        'genres': ['Action', 'Adventure'],
        'id': 123,
        'uuid': 'abc123',
        'title': 'Awesome Movie',
      };

      final movie = Movie.fromJson(json);

      expect(movie, isA<Movie>());
      expect(movie.backdropPath, '/path/to/backdrop.jpg');
      expect(movie.genres, ['Action', 'Adventure']);
      expect(movie.id, '123');
      expect(movie.uuid, 'abc123');
      expect(movie.imdbID, '');
      expect(movie.originalLanguage, '');
      expect(movie.overview, '');
      expect(movie.popularity, '');
      expect(movie.posterPath, '');
      expect(movie.releaseDate, '');
      expect(movie.runtime, '');
      expect(movie.status, '');
      expect(movie.tagline, '');
      expect(movie.title, 'Awesome Movie');
      expect(movie.voteAverage, '');
    });
  });
}
