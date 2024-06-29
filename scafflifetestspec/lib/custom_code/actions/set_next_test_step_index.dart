// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double>? setNextTestStepIndex(
    List<TestStepsRecord> testStepDocuments) async {
  List<TestStepsRecord> x = [];
  double max = 0.0;
  for (TestStepsRecord doc in testStepDocuments) {
    if (doc.index > max) {
      max = doc.index;
    }
  }
  double next = max + 1.0;
  FFAppState().nextTestStepIndex = next;
  return next;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
