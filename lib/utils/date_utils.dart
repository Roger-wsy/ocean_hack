import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime? dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now());
}

getDayOfWeek(DateTime? dateTime) {
  return DateFormat('EEEE').format(dateTime ?? DateTime.now()).substring(0, 3);
}

getTime(DateTime? dateTime) {
  return DateFormat('h:mm a').format(dateTime ?? DateTime.now());
}

bool isSameDay(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }

  return a.year == b.year && a.month == b.month && a.day == b.day;
}

DateTime convertTo12AM(DateTime dateTime) {
  int offset = dateTime.timeZoneOffset.inHours;
  dateTime =
      DateTime(dateTime.year, dateTime.month, dateTime.day, offset, 0, 0, 0);

  int newTimestampMilliseconds = dateTime.millisecondsSinceEpoch;

  return DateTime.fromMicrosecondsSinceEpoch(newTimestampMilliseconds);
}

int timeToMilliseconds(DateTime dateTime) {
  return dateTime.hour * 3600000 + // Hours to milliseconds
      dateTime.minute * 60000 + // Minutes to milliseconds
      dateTime.second * 1000 + // Seconds to milliseconds
      dateTime.millisecond; // Milliseconds
}

TimeOfDay millisecondsToTime(int milliseconds) {
  int hours = milliseconds ~/ 3600000;
  int remainingMilliseconds = milliseconds % 3600000;
  int minutes = remainingMilliseconds ~/ 60000;

  return TimeOfDay(hour: hours, minute: minutes);
}


