// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../widgets/permissions.dart';

Future addLinkFromChapter(
  DocumentReference? sourceChapter,
  String? sourceChapterBody,
  DocumentReference? targetChapter,
  DocumentReference? hyperbook,
) async {
  //const String before = '<br><a href="#';
  //const String after = '" target="_blank">LINK</a>';
  //<br><a href="#hyperbooks/CT3ZqDTUNj0xgTWmTqWL/chapters/K5bXnfKhWPa9s1FddmFE" target="_blank">TITLE</a>
  final String h = targetChapter!.path;
  final String hyperlink = before + h + middle + '[LINK]' + after;
  final String newBody = sourceChapterBody! + hyperlink;
  final chaptersUpdateData = createChaptersRecordData(
    body: newBody,
  );
  await sourceChapter!.update(chaptersUpdateData);
}

// const String before = '<a href="#';
//    const String middle =
//      '" target="_blank"style="background-color:black;color:white;padding:2px;border:2px solid grey;border-radius:5px">';
//  const String after = '</a>';
