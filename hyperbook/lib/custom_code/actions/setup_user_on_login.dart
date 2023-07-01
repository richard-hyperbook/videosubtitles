// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future setupUserOnLogin(BuildContext context, List<int>? userColorsInts) async {
  FFAppState().chosenColors.clear();

  for (int i = 0; i < userColorsInts!.length; i++) {
    FFAppState().chosenColors.add(Color(userColorsInts[i]));
  }
}
