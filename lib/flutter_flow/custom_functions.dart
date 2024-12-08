import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkNotificationTimes(List<DateTime> previousNotificationTimes) {
  // Return true if previousNotificationTimes contains dates within this week
  final now = DateTime.now();
  final startOfWeek = DateTime(now.year, now.month, now.day)
      .subtract(Duration(days: now.weekday - 1));
  final endOfWeek = startOfWeek.add(Duration(days: 6));
  for (final notificationTime in previousNotificationTimes) {
    if (notificationTime.isAfter(startOfWeek) &&
        notificationTime.isBefore(endOfWeek)) {
      return true;
    }
  }
  return false;
}

DateTime returnRandomTime(List<DateTime>? previousScheduledDays) {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final fiveDaysFromNow = tomorrow.add(Duration(days: 5));
  final random = math.Random();

  // Initialize with a default value
  DateTime randomTime = now;
  // Initialize isTimeValid to false
  bool isTimeValid = false;

  do {
    // Generate a random day between tomorrow and 5 days from now.
    final randomDay = tomorrow.add(Duration(days: random.nextInt(5)));
    // Generate a random hour between 10 AM (10) and 7 PM (19).
    final randomHour =
        10 + random.nextInt(9); // This will give you a range of 10 to 18
    // Create a DateTime object with the random day and hour.
    randomTime =
        DateTime(randomDay.year, randomDay.month, randomDay.day, randomHour);

    // Check if the generated day is not in the previousScheduledDays and the time is between 10 AM and 7 PM.
    isTimeValid = (randomTime.isAfter(tomorrow) &&
            randomTime.isBefore(fiveDaysFromNow)) &&
        (previousScheduledDays?.any((scheduledDay) =>
                    scheduledDay.day == randomTime.day &&
                    scheduledDay.month == randomTime.month &&
                    scheduledDay.year == randomTime.year) ??
                false) ==
            false &&
        randomTime.hour >= 10 &&
        randomTime.hour < 19;
    // Continue looping if the time is not valid.
  } while (!isTimeValid);

  return randomTime;
}

String randomTitlePicker() {
  // Randomly pick between Hi, hello and hey
  final titles = [
    "Ready to start Posting? 📷",
    "Relax, we'll handle the posting 😎",
    "Let's grow your social media presence 📈",
    "Let us handle the posting 📅",
  ];
  final random = math.Random();
  final index = random.nextInt(titles.length);
  return titles[index];
}

String randomDailyGreeting(String firstName) {
  final now = DateTime.now();
  final daySeed = now.month + now.day + now.year;
  final random = math.Random(daySeed);
  final phrases = [
    "Let's Automate, $firstName!",
    "Let's create a post, $firstName!",
    "Ready to create some magic, $firstName?",
    "Let's make today great, $firstName!",
    "Unleash your creativity, $firstName!",
    "Ready to share some perspective, $firstName?",
    "Let's turn ideas into art, $firstName!",
    "Welcome back to your growth generator, $firstName!",
    "Automation awaits at your fingertips, $firstName!",
    "Let your imagination soar, $firstName!",
    "Bring your posts to video, $firstName!",
    "Your creative journey continues, $firstName!",
    "Let's inspire, $firstName!",
    "Let's create, $firstName!",
    "Were really your pal, $firstName!",
    "Let's grow your socials, $firstName!"
  ];

  // Randomly pick one of the phrases
  final welcomePhrase = phrases[random.nextInt(phrases.length)];
  return welcomePhrase;
}

bool checkGreetingTime(DateTime lastGreetingTime) {
  // if lastGreetingTime is the same day as today, return true
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final lastGreetingDay = DateTime(
      lastGreetingTime.year, lastGreetingTime.month, lastGreetingTime.day);
  return lastGreetingDay == today;
}

DocumentReference stringToDocRef(String documentID) {
  // Convert the document ID as a string into the document Reference
  return FirebaseFirestore.instance.collection('albums').doc(documentID);
}

String imagePathToString(String imagePath) {
  return imagePath;
}

DateTime twoMinutesAgo() {
  return DateTime.now().subtract(Duration(minutes: 2));
}

bool isMoreThanWeek(
  DateTime oldTime,
  DateTime newTime,
) {
  return newTime.difference(oldTime).inDays >= 7;
}
