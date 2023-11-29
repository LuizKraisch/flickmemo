import 'package:flickmemo/services/formatters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  setUp(() async {
    await initializeDateFormatting('en-US', null);
  });

  group('Formatters', () {
    group('formatMovieReleaseYear', () {
      test('returns year if releaseDate is not empty', () {
        expect(formatMovieReleaseYear('2022-01-01'), '2022');
      });

      test('returns N/A if releaseDate is empty', () {
        expect(formatMovieReleaseYear(''), 'N/A');
      });
    });

    group('formatProfileCreationDate', () {
      test('returns formatted date if inputDate is not empty', () {
        expect(
          formatProfileCreationDate('2022-01-01', 'en'),
          DateFormat('MMMM, y', 'en').format(DateTime.parse('2022-01-01')),
        );
      });

      test('returns N/A if inputDate is empty', () {
        expect(formatProfileCreationDate('', 'en'), 'N/A');
      });
    });

    group('formatMovieReleaseDate', () {
      test('returns formatted date if inputDate is not empty', () {
        expect(
          formatMovieReleaseDate('2022-01-01'),
          DateFormat('d MMM, y').format(DateTime.parse('2022-01-01')),
        );
      });

      test('returns N/A if inputDate is empty', () {
        expect(formatMovieReleaseDate(''), 'N/A');
      });
    });

    group('formatExternalReviewDate', () {
      test('returns formatted date if inputDate is not empty', () {
        expect(
          formatExternalReviewDate('2022-01-01'),
          DateFormat('MMM d, y').format(DateTime.parse('2022-01-01')),
        );
      });

      test('returns N/A if inputDate is empty', () {
        expect(formatExternalReviewDate(''), 'N/A');
      });
    });

    group('formatExternalReviewContent', () {
      test('removes special characters from content', () {
        expect(
          formatExternalReviewContent('This is @a %sample review//'),
          'This is a sample review',
        );
      });
    });

    group('formatRuntime', () {
      test('returns formatted runtime if inputRuntime is not empty', () {
        expect(formatRuntime('90'), '1h 30m');
      });

      test('returns N/A if inputRuntime is empty', () {
        expect(formatRuntime('0'), 'N/A');
      });
    });

    group('formatFloat', () {
      test('returns formatted float with one decimal place', () {
        expect(formatFloat('3.14159'), '3.1');
        expect(formatFloat('2.5'), '2.5');
      });
    });
  });
}
