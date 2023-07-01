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
import '/auth/firebase_auth/auth_util.dart';

int convertTypeDropdownToInt(String? dropdownChoice) {
  int? type;
  type = int.tryParse(dropdownChoice!);
  return type ?? 0;
}

List<int> returnDefaultChapterColorsInts() {
  List<int> defaultColors = [
    Colors.black.value,
    Colors.lime.value,
    Colors.blueGrey.value,
    Colors.blue.value,
    Colors.amber.value,
    Colors.grey.value,
  ];
  return defaultColors;
}

Color setChapterColor(
  int? index,
  List<Color>? chapterReadColors,
) {
  if (index! < chapterReadColors!.length) {
    return chapterReadColors[index];
  } else {
    return Colors.pink;
  }
}

List<int> setCChosenColorsDatabaseFieldFromLocalState(List<Color>? colorList) {
  List<int> intColors = [];
  for (Color color in colorList!) {
    intColors.add(color.value);
  }
  return intColors;
}

int getChapterStateFromList(
  int? index,
  List<int>? chapterStateList,
) {
  if ((index == null) ||
      (chapterStateList == null) ||
      (index >= chapterStateList.length)) {
    return 0;
  }
  return chapterStateList[index!];
}

DocumentReference? returnChapterReadReference(
  int? index,
  List<DocumentReference>? currentHyperbookReadReferenceList,
) {
  if ((index == null) ||
      (currentHyperbookReadReferenceList == null) ||
      (index >= currentHyperbookReadReferenceList.length)) {
    return null;
  }
  return currentHyperbookReadReferenceList[index];
}

bool returnFalse() {
  return false;
}

bool returnTrue() {
  return true;
}

DocumentReference? returnNull() {
  return null;
}
