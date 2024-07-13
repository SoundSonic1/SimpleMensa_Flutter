class DateTimeUtil {
  DateTimeUtil._();

  static List<DateTime> buildDateTimeList(int days) {
    final startDateTime = DateTime.now();
    final dateTimeList = <DateTime>[];
    for (int i = 0; i < days; i++) {
      dateTimeList.add(startDateTime.add(Duration(days: i)));
    }
    return dateTimeList;
  }
}
