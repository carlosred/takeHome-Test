// ignore_for_file: file_names

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    String formattedDateTime =
        DateFormat('dd-MM-yyyy : HH:mm').format(dateTime);
    return formattedDateTime;
  }

  static Future<void> launchUrlWeb({required String url}) async {
    if (!await launchUrl(
      Uri.parse(url),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
