import 'package:intl/intl.dart';

class Formater {
  static String toIDR(String number) {
    return NumberFormat.decimalPattern('id').format(int.parse(number));
  }

  static String dateTime(String data) {
    var dateTime = DateTime.parse(data);
    var formatedDate = DateFormat('EEEE, d MMM yyyy', "id_ID").format(dateTime);
    var formatedTime = DateFormat('HH:mm').format(dateTime);
    return "$formatedDate • Pukul: $formatedTime";
  }

  static String date(String data) {
    var dateTime = DateTime.parse(data);
    var formatedDate = DateFormat('EEEE, d MMM yyyy', "id_ID").format(dateTime);
    return formatedDate;
  }

  static String time(String data) {
    var dateTime = DateTime.parse(data);
    var formatedTime = DateFormat('HH:mm').format(dateTime);
    return formatedTime;
  }

  static String timeDifference(String data) {
    var time = DateTime.parse(data);
    var timeDiff = DateTime.now().difference(time);

    if (timeDiff.inHours == 0) {
      return "${timeDiff.inMinutes} Menit";
    } else if (timeDiff.inHours > 99) {
      return "${timeDiff.inHours} Jam";
    }

    return "${timeDiff.inHours} Jam ${timeDiff.inMinutes % 60} Menit";
  }

  static String timeDiffInHours(String data) {
    var time = DateTime.parse(data);
    var timeDiff = DateTime.now().difference(time);

    return "${timeDiff.inHours}";
  }
}
