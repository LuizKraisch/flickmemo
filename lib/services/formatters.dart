import 'package:intl/intl.dart';

String formatDate(String inputDate) {
  final DateTime date = DateTime.parse(inputDate);
  final String formattedDate = DateFormat('MMMM, y').format(date);
  return formattedDate;
}
