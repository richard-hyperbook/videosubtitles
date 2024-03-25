// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import '../../../app_state.dart';

//import '/pages/home_page/home_page_model.dart';
//export '/pages/home_page/home_page_model.dart';

Future<int> calculateNextIssueNumber() async {
// List<Issues2Record> _model.issueCollection;
  int maxNumber = 0;
  List<Issues2Record> issue2Record = await queryIssues2RecordOnce();

  for (Issues2Record x in issue2Record) {
    print('(K1)${maxNumber}£${x}');
    if (x.ticketNumber > maxNumber) {
      maxNumber = x.ticketNumber;
    }
  }
  maxNumber++;
  FFAppState().nextTicketNumber = maxNumber;
  print('(K2)${maxNumber}');
  return maxNumber;
}
