import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:technikapp/common/extensions_manager.dart';

class DateTimeUtil {
  DateTimeUtil._();

  static const FORMAT_FULL = "dd-MM-yyyy, hh:mm a";
  static const FORMAT_FULL_YYYY_MM_DDD = "yyyy-MM-dd, hh:mm a";
  static const FORMAT_FULL_YYYY_MM_DDD_WITH_SECONDS = "yyyy-MM-ddThh:mm:ss";
  static const FORMAT_TIME_12_HRS = "hh:mm a";
  static const FORMAT_TIME_24_HRS_FULL = "HH:mm:ss";
  static const FORMAT_DD_MM_YYYY = "dd-MM-yyyy";
  static const FORMAT_DD_MM_YYYY_WITH_SLASH = "dd/MM/yyyy";
  static const FORMAT_YYYY_MM_DD = "yyyy-MM-dd";
  static const FORMAT_MMM_DD_YYYY = "MMM dd, yyyy";
  static const FORMAT_MM_YYYY = "MM-yyyy";
  static const FORMAT_MMM_YYYY = "MMM, yyyy";
  static const FORMAT_SPLITTER = "%";
  static const FORMAT_DD_MMM_YYYY = "dd MMM yyyy";
  static const FORMAT_DD = "dd";
  static const FORMAT_DAY = "EE";
  static const FORMAT_YYY_MM_DD_24HR = "yyyy-MM-dd  kk:mm:ss";
  static const FORMAT_YYYY_MM_DD_T_HH_MM_SS_SSSZ = "HH:mm:ss.SSSZ";
  static const HH_MM_SS_SSSZ = "yyyy-MM-ddTHH:mm:ss.SSSZ";
  static const FORMAT_YYYY_MM_DD_T_HH_MM_SS_SSS = "yyyy-MM-dd HH:mm:ss.SSS";
  static DateTime? getLocalDateFromUTC(String utcDate) {
    return DateTime.tryParse(utcDate)?.toLocal();
  }

  static DateTime? getUTCDate(String utcDate) {
    return DateTime.tryParse(utcDate);
  }

  static String getReadableLocalDateTimeFromUTC(String utcDate,
      {String formatPattern = FORMAT_FULL}) {
    if (utcDate.isNullOrEmpty()) return "";

    DateTime? utcDateTime = DateTime.tryParse(utcDate);
    if (utcDateTime == null) return utcDate;

    DateTime localDateTime = utcDateTime.toLocal();
    return DateFormat(formatPattern).format(localDateTime);
  }

  static String getReadableLocalDateTimeFromUTCDateTime(DateTime utcDate,
      {String formatPattern = FORMAT_FULL}) {
    DateTime localDateTime = utcDate.toLocal();
    return DateFormat(formatPattern).format(localDateTime);
  }

  static String formatDate(DateTime dateTime,
      {String formatPattern = FORMAT_DD_MM_YYYY}) {
    var formatter = DateFormat(formatPattern);
    return formatter.format(dateTime);
  }

  static String formatDateParameter(DateTime dateTime,
      {String formatPattern = FORMAT_DD_MM_YYYY_WITH_SLASH}) {
    var formatter = DateFormat(formatPattern);
    return formatter.format(dateTime);
  }

  static String formatTime(TimeOfDay timeOfDay,
      {String formatPattern = FORMAT_TIME_12_HRS}) {
    var formatter = DateFormat(formatPattern);
    var dateTimeNow = DateTime.now();
    var dateTime = DateTime(dateTimeNow.year, dateTimeNow.month,
        dateTimeNow.day, timeOfDay.hour, timeOfDay.minute);
    return formatter.format(dateTime);
  }

  static String formatDateFromString(String? dateTime,
      {String inputFormat = FORMAT_DD_MM_YYYY,
      String outputFormat = FORMAT_YYYY_MM_DD}) {
    if (dateTime == null || dateTime.isEmpty) return "";
    try {
      var formatter = DateFormat(inputFormat);
      var parse = formatter.parse(dateTime);
      var outputFormatter = DateFormat(outputFormat);
      return outputFormatter.format(parse);
    } catch (e, s) {
      /*FirebaseCrashlytics.instance.recordError(e, s,
          reason:
              "Error in parsing the $dateTime inside formatDateFromString with $inputFormat as input and $outputFormat as output");*/
      return dateTime;
    }
  }

  static String formatDateFromDateTime(DateTime? inputDateTime,
      {String outputFormat = FORMAT_YYYY_MM_DD}) {
    if (inputDateTime == null) return "";
    try {
      var outputFormatter = DateFormat(outputFormat);
      return outputFormatter.format(inputDateTime);
    } catch (e, s) {
      /*FirebaseCrashlytics.instance.recordError(e, s,
          reason:
              "Error in parsing the ${inputDateTime.toIso8601String()} inside formatDateFromDateTime with $outputFormat as output");*/
      return "";
    }
  }

  static String formatDateForAPI(String? dateTime,
      {String inputFormat = FORMAT_DD_MM_YYYY,
      String outputFormat = FORMAT_YYYY_MM_DD}) {
    return formatDateFromString(dateTime,
        inputFormat: inputFormat, outputFormat: outputFormat);
  }

  static String formatDateForAPIFromDateTime(DateTime? dateTime,
      {String outputFormat = FORMAT_YYYY_MM_DD}) {
    return formatDateFromDateTime(dateTime, outputFormat: outputFormat);
  }

  static String formatDateForLocalDisplayFromAPI(String? dateTime,
      {String inputFormat = FORMAT_YYYY_MM_DD,
      String outputFormat = FORMAT_DD_MM_YYYY}) {
    return formatDateFromString(dateTime,
        inputFormat: inputFormat, outputFormat: outputFormat);
  }

  static int getStartQuarterMonthBasedOnCurrentMonth(int currentMonth) {
    if (currentMonth == DateTime.january ||
        currentMonth == DateTime.february ||
        currentMonth == DateTime.march) return DateTime.january;

    if (currentMonth == DateTime.april ||
        currentMonth == DateTime.may ||
        currentMonth == DateTime.june) return DateTime.april;

    if (currentMonth == DateTime.july ||
        currentMonth == DateTime.august ||
        currentMonth == DateTime.september) return DateTime.july;

    //If the month is not from one of above than it is defiantly from the last quarter.
    return DateTime.october;
  }

  static int getEndQuarterMonthBasedOnCurrentMonth(int currentMonth) {
    if (currentMonth == DateTime.january ||
        currentMonth == DateTime.february ||
        currentMonth == DateTime.march) return DateTime.march;

    if (currentMonth == DateTime.april ||
        currentMonth == DateTime.may ||
        currentMonth == DateTime.june) return DateTime.june;

    if (currentMonth == DateTime.july ||
        currentMonth == DateTime.august ||
        currentMonth == DateTime.september) return DateTime.september;

    //If the month is not from one of above than it is defiantly from the last quarter.
    return DateTime.december;
  }

  static DateTime getFirstDateOfGivenMonthYear(String? monthYear,
      {String inputFormat = DateTimeUtil.FORMAT_MM_YYYY}) {
    if (monthYear == null || monthYear.isEmpty) return DateTime.now();

    var formatter = DateFormat(inputFormat);
    var parsedDate = formatter.parse(monthYear);
    var firstDate = DateTime(parsedDate.year, parsedDate.month, 1);
    return firstDate;
  }

  static DateTime getLastDateOfGivenMonthYear(String? monthYear,
      {String inputFormat = DateTimeUtil.FORMAT_MM_YYYY}) {
    if (monthYear == null || monthYear.isEmpty) return DateTime.now();

    var formatter = DateFormat(inputFormat);
    var parsedDate = formatter.parse(monthYear);
    var lastDayDateTime = (parsedDate.month < 12)
        ? DateTime(parsedDate.year, parsedDate.month + 1, 0)
        : DateTime(parsedDate.year + 1, 1, 0);
    return lastDayDateTime;
  }

  static String generateStartEndMixedDate(String startDate, String endDate) {
    return "$startDate$FORMAT_SPLITTER$endDate";
  }

  static List<String> getStartEndDateFromMixedDate(String startEndDate) {
    if (!canParseMixedStartEndDate(startEndDate)) {
      return List.generate(2, (index) => "");
    }

    var list = startEndDate.split(FORMAT_SPLITTER);
    if (list.isEmpty) return List.generate(2, (index) => "");

    if (list.length == 1) return list..add("");

    return list;
  }

  static bool canParseMixedStartEndDate(String startEndDate) {
    return startEndDate.contains(FORMAT_SPLITTER);
  }

  static DateTime? getDateFromString(String? dateTime,
      {String inputFormat = FORMAT_DD_MM_YYYY}) {
    if (dateTime == null || dateTime.isEmpty) return null;

    var formatter = DateFormat(inputFormat);
    var parse = formatter.parse(dateTime);
    return parse;
  }

  static DateTime getLastDateOfCurrentMonth() {
    var currentDate = DateTime.now();
    var parsedDate =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    var lastDayDateTime = (parsedDate.month < 12)
        ? DateTime(parsedDate.year, parsedDate.month + 1, 0)
        : DateTime(parsedDate.year + 1, 1, 0);
    return lastDayDateTime;
  }

  static int getDifferenceInDaysExcludingSunday(
      DateTime startDate, DateTime endDate) {
    int nbDays = 0;
    DateTime currentDay = startDate;
    while (currentDay.isBefore(endDate)) {
      currentDay = currentDay.add(const Duration(days: 1));
      if (currentDay.weekday != DateTime.sunday) {
        nbDays += 1;
      }
    }
    return nbDays;
  }

  static String getReadableLocalFromTimeStamp(int milliSecond,
      {String formatPattern = FORMAT_DD_MM_YYYY}) {
    var dateTime =
        DateTime.fromMillisecondsSinceEpoch(milliSecond, isUtc: true);
    return getReadableLocalDateTimeFromUTCDateTime(dateTime,
        formatPattern: formatPattern);
  }

  static bool isLocalDateDifferent(
      int firstDateMilliSecond, int secondDateMilliSecond) {
    var firstDate =
        DateTime.fromMillisecondsSinceEpoch(firstDateMilliSecond, isUtc: true);
    var secondDate =
        DateTime.fromMillisecondsSinceEpoch(secondDateMilliSecond, isUtc: true);
    var firstDateLocal = firstDate.toLocal();
    var secondDateLocal = secondDate.toLocal();
    if (firstDateLocal.year == secondDateLocal.year &&
        firstDateLocal.month == secondDateLocal.month &&
        firstDateLocal.day == secondDateLocal.day) {
      return false;
    } else {
      return true;
    }
  }

  static bool isDateDifferentDateTime(DateTime firstDate, DateTime secondDate) {
    if (firstDate.year == secondDate.year &&
        firstDate.month == secondDate.month &&
        firstDate.day == secondDate.day) {
      return false;
    } else {
      return true;
    }
  }

  static bool isMoreThan24Hours(int millieSecond) {
    var lastFetchDateTime = DateTime.fromMillisecondsSinceEpoch(millieSecond);
    var currentDateTime = DateTime.now();
    var difference = currentDateTime.difference(lastFetchDateTime);
    var differenceInHour = difference.inDays;
    if (differenceInHour >= 1) {
      return true;
    } else {
      return false;
    }
  }

  static String getStartEndTimeString(
      String? startTimeString, String? endTimeString,
      {String inputFormat = FORMAT_TIME_24_HRS_FULL,
      String outputFormat = FORMAT_TIME_12_HRS}) {
    var startTime = formatDateForLocalDisplayFromAPI(startTimeString,
            inputFormat: inputFormat, outputFormat: outputFormat)
        .orEmpty();
    var endTime = formatDateForLocalDisplayFromAPI(endTimeString,
            inputFormat: inputFormat, outputFormat: outputFormat)
        .orEmpty();
    return "$startTime - $endTime";
  }
}
