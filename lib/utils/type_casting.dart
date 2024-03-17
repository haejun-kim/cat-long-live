import 'package:intl/intl.dart';

DateTime stringToDateTime(String strDate) {
  return DateFormat('yyyy-MM-dd').parse(strDate);
}

String dateTimeToString(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}
