import 'package:get/get.dart';

class DateTimeManager extends GetxController {
  var now = DateTime.now().obs;
  var calanderDayCanBeColored = true.obs;
  monthInTextFormat(int month) {
    if (month == DateTime.january) {
      return ' January';
    }
    if (month == DateTime.february) {
      return 'February';
    }
    if (month == DateTime.march) {
      return 'March';
    }
    if (month == DateTime.april) {
      return 'April';
    }
    if (month == DateTime.may) {
      return 'May';
    }
    if (month == DateTime.june) {
      return 'June';
    }
    if (month == DateTime.july) {
      return 'July';
    }
    if (month == DateTime.august) {
      return 'August';
    }
    if (month == DateTime.september) {
      return 'September';
    }
    if (month == DateTime.october) {
      return 'October';
    }
    if (month == DateTime.november) {
      return 'November';
    }
    if (month == DateTime.december) {
      return 'December';
    }
  }
}
