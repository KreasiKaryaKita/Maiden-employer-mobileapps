import 'package:intl/intl.dart';

class DateHelper {
  static String millisToString(int millis, String pattern) {
    var date = DateTime.fromMillisecondsSinceEpoch(millis);
    return DateFormat(pattern).format(date);
  }

  static int standartStringToMillis(String dateString) {
    DateFormat originFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    return originFormat.parse(dateString).millisecondsSinceEpoch;
  }

  static String stringDateToOtherStringDate(String dateString,
      {String originPattern = "yyyy-MM-dd'T'HH:mm:ss", String finalPattern = "dd/MM/yyyy"}) {
    if (dateString == '') return '';

    DateFormat originFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    DateFormat finalFormat = DateFormat(finalPattern);
    DateTime dateTime = originFormat.parse(dateString);
    return finalFormat.format(dateTime);
  }

  static DateTime stringDateToDateTime(String date, String pattern) {
    DateFormat dateFormat = DateFormat(pattern);
    return dateFormat.parse(date);
  }

  static int differenceDate(String date1, String date2, String pattern) {
    final dateTime1 = stringDateToDateTime(date1, pattern);
    final dateTime2 = stringDateToDateTime(date2, pattern);
    return dateTime1.difference(dateTime2).inDays;
  }

  static DateTime datetimeToOtherDatetime(DateTime date, String pattern) {
    final stringDate = dateTimeToString(date, pattern);
    return stringDateToDateTime(stringDate, pattern);
  }

  static String currentDate(String pattern) {
    return DateFormat(pattern).format(DateTime.now());
  }

  static String currentStandartDate() {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now());
  }

  static String dateTimeToString(DateTime dateTime, String pattern) {
    final DateFormat formatter = DateFormat(pattern, 'id');
    return formatter.format(dateTime);
  }
}
