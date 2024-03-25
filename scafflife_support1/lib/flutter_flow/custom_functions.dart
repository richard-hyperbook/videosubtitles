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

String? issueComponentNumberToString(int? index) {
  const List<String> names = [
    'unknown', //0
    'issueTitle', //1: issueTitle,
    'issueDescription', //2: issueDescription,
    'dateRaised', //3: dateRaised,
    'versionSoftwareRaised', //4: versionSoftwareRaised,
    'versionSoftwareFixed', //5: versionSoftwareFixed,
    'dateFixed', //6: dateFixed,
    'status', //7: status,
    'notes', //8: notes,
    'ticketNumber', //9: ticketNumber,
    'raisedBy', //10: raisedBy,
    'urgency', //11: urgency,
    'screenshot', //12: screenshot,
  ];
  if ((index == null) || (index >= names.length)) return names[0];
  return names[index];
}
