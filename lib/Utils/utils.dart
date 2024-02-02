import 'package:intl/intl.dart';

class Utils {
  static String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    String formattedDateTime =
        DateFormat('dd-MM-yyyy : HH:mm').format(dateTime);
    return formattedDateTime;
  }
}
