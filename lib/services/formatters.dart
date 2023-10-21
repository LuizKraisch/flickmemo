import 'package:intl/intl.dart';

String formatProfileCreationDate(String inputDate) {
  final DateTime date = DateTime.parse(inputDate);
  final String formattedDate = DateFormat('MMMM, y').format(date);
  return formattedDate;
}

String formatMovieReleaseDate(String inputDate) {
  final DateTime date = DateTime.parse(inputDate);
  final String formattedDate = DateFormat('d MMM, y').format(date);
  return formattedDate;
}

String formatExternalReviewDate(String inputDate) {
  final DateTime date = DateTime.parse(inputDate);
  final String formattedDate = DateFormat('MMM d, y').format(date);
  return formattedDate;
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
