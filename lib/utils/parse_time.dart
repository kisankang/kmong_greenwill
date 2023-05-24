class ParseTime {
  static String toRTDB(DateTime time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String min = time.minute.toString().padLeft(2, '0');
    return hour + ":" + min;
  }

  static DateTime fromRTDB(String time) {
    int hour = int.parse(time.split(':')[0]);
    int min = int.parse(time.split(':')[1]);
    return DateTime.now().copyWith(hour: hour, minute: min);
  }
}
