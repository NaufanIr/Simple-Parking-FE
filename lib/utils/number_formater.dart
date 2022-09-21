import 'package:intl/intl.dart';

class NumberFormater {
  static String toIDR(String number) {
    return NumberFormat.decimalPattern('id').format(int.parse(number));
  }
}