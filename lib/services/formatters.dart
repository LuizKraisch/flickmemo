import 'package:intl/intl.dart';

String formatMovieReleaseYear(String releaseDate) {
  if (releaseDate != "") {
    return DateTime.parse(releaseDate).year.toString();
  }

  return 'N/A';
}

String formatProfileCreationDate(String inputDate, String languageCode) {
  if (inputDate.isNotEmpty) {
    final DateTime date = DateTime.parse(inputDate);

    final String formattedDate =
        DateFormat('MMMM, y', languageCode).format(date);
    return formattedDate;
  }

  return 'N/A';
}

String formatMovieReleaseDate(String inputDate) {
  if (inputDate != "") {
    final DateTime date = DateTime.parse(inputDate);
    final String formattedDate = DateFormat('d MMM, y').format(date);
    return formattedDate;
  }

  return 'N/A';
}

String formatExternalReviewDate(String inputDate) {
  if (inputDate != "") {
    final DateTime date = DateTime.parse(inputDate);
    final String formattedDate = DateFormat('MMM d, y').format(date);
    return formattedDate;
  }

  return 'N/A';
}

String formatExternalReviewContent(String content) {
  RegExp pattern = RegExp(r'[@\$%^&*_+={}\[\]\<>/\\|]');

  return content.replaceAll(pattern, '');
}

String formatRuntime(String inputRuntime) {
  final int runtime = int.parse(inputRuntime);

  int hours = runtime ~/ 60;
  int minutes = runtime % 60;

  if (hours != 0 && minutes != 0) {
    if (hours == 0) {
      return '${minutes}m';
    } else if (minutes == 0) {
      return '${hours}h';
    } else {
      return '${hours}h ${minutes}m';
    }
  } else {
    return 'N/A';
  }
}

String formatFloat(String float) {
  final double number = double.parse(float);
  final String formattedNumber = number.toStringAsFixed(1);

  return formattedNumber;
}
