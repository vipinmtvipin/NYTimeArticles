import 'package:intl/intl.dart';

class CommonUtil {

  String currentTime() {
    var now = DateTime.now();
    var time = DateFormat("H:m:s").format(now);
    return time.toString();
  }

  String currentDateTimeMilli() {
    var now = DateTime.now();
    return now.millisecondsSinceEpoch.toString();
  }

  String currentDateTime() {
    var now = DateTime.now();
    var time = DateFormat("dd-MM-yyyy hh:mm:ss").format(now);
    return time.toString();
  }

  String dateFormater(String data) {
    try {
      DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(data);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('yyyy-MM-dd');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } catch (e) {
      return data;
    }
  }

  String dateFormaterTime(String data) {
    try {
      DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(data);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('hh:mm a');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } catch (e) {
      return data;
    }
  }

  String currentDate(String from) {
    var now = DateTime.now();
    String date;
    if (from == "revers") {
      date = DateFormat("yyyy-MM-dd").format(now);
    } else {
      date = DateFormat("dd-MM-yyyy").format(now);
    }
    return date.toString();
  }

}
