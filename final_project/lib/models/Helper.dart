import 'package:intl/intl.dart';

List<String> specialties = [
  'Cardiology',
  'Neurology',
  'Dermatology',
  'Gastroenterology',
  'Orthopedics',
  'Oncology',
  'Pediatrics',
  'Psychiatry',
  'Ophthalmology',
  'Pulmonology',
  'Otolaryngology (ENT)',
  'Nephrology',
  'Urology',
];

double intToDouble(int value) {
  return value.toDouble();
}

int getIndexOfString(List<String> list, String target) {
  return list.indexOf(target);
}

String calculateAge(String? birthDateString) {
  if (birthDateString == null) {
    return "unknown";
  }

  DateTime birthDate = DateTime.tryParse(birthDateString) ?? DateTime.now();
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;

  // If the current month-day is before the birth month-day, subtract one year from the age
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }

  return age.toString();
}

bool isBeforeCurrentTime(String timeString, String dateString) {
  // Parse the date string into year, month, and day
  List<String> dateParts = dateString.split('-');
  int year = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int day = int.parse(dateParts[2]);

  // Parse the time string into hours, minutes, and seconds
  List<String> timeParts = timeString.split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);
  int second = int.parse(timeParts[2]);

  // Get the current date and time
  DateTime now = DateTime.now();

  // Create a DateTime object for the given date and time
  DateTime givenDateTime = DateTime(year, month, day, hour, minute, second);

  // Compare the given date and time with the current date and time
  return givenDateTime.isBefore(now);
}

String calculateRemainingTime(String date, String time) {
  // Combine the date and time strings
  String dateTimeString = "$date $time";

  // Define the format of the input date and time strings
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  // Parse the combined string into a DateTime object
  DateTime appointmentDateTime = dateFormat.parse(dateTimeString);

  // Get the current DateTime
  DateTime now = DateTime.now();

  // Calculate the difference
  Duration difference = appointmentDateTime.difference(now);

  // If the appointment time is in the past, return "Time has passed"
  if (difference.isNegative) {
    return "OnGoing meeting ";
  }

  // Convert the difference to a readable string
  String remainingTime = "";

  if (difference.inDays > 0) {
    remainingTime += "${difference.inDays} days ";
  }
  if (difference.inHours.remainder(24) > 0) {
    remainingTime += "${difference.inHours.remainder(24)} hours ";
  }
  if (difference.inMinutes.remainder(60) > 0) {
    remainingTime += "${difference.inMinutes.remainder(60)} minutes ";
  }

  return remainingTime.trim();
}

String convertTimeFormat(String time24) {
  DateTime time = DateTime.parse("1970-01-01 $time24");
  String hour = time.hour > 12
      ? (time.hour - 12).toString().padLeft(2, '0')
      : time.hour.toString().padLeft(2, '0');
  String period = time.hour >= 12 ? "PM" : "AM";
  return "$hour:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')} $period";
}
