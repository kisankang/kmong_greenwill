class ParseTime {
  static String forRTDB(DateTime time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String min = time.minute.toString().padLeft(2, '0');
    return hour + ":" + min;
  }
}
