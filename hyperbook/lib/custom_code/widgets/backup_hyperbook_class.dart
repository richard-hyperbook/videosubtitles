// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'permissions.dart';

extension HyperbooksExtra on HyperbooksRecord {
  Map<String, dynamic> toJson() {
    return {
      'members': members,
      'title': title,
      'blurb': blurb,
      'type': type,
      'requiresReaderApproval': requiresReaderApproval,
      'requiresCollaboratorApproval': requiresWriterApproval,
      'collabratorPriviledges': collabratorPriviledges,
      'visibility': visibility,
    };
  }
}

extension ChaptersExtra on ChaptersRecord {
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'xCoord': xCoord,
      'yCoord': yCoord,
      'chapterSymbol': chapterSymbol,
      'awaitingApproval': awaitingApproval,
      'isStartChapter': isStartChapter,
    };
  }
}

class BackupHyperbookClass extends StatefulWidget {
  const BackupHyperbookClass({
    Key? key,
    this.width,
    this.height,
    this.hyperbook,
    this.hyperbookTitle,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? hyperbook;
  final String? hyperbookTitle;

  @override
  _BackupHyperbookClassState createState() => _BackupHyperbookClassState();
}

Future<String> populateHyperbook(DocumentReference? hyperbook) async {
  HyperbooksRecord hyperbookRec;
  hyperbookRec = await HyperbooksRecord.getDocumentOnce(hyperbook!);
  print('(D847-1)${hyperbookRec}');
  String hypebookJson = jsonEncode(
    hyperbookRec.toJson(),
    toEncodable: (Object? value) => '',
  );
  String chaptersJson = '[';
  for (int i = 0; i < chapterList.length; i++) {
    var chapter = chapterList[i];
    String cJson = jsonEncode(
      chapter.toJson(),
      toEncodable: (Object? value) => '',
    );
    chaptersJson = chaptersJson + cJson + ',';
  }
  chaptersJson = chaptersJson + ']';
  return hypebookJson + '\n' + chaptersJson;
}

class _BackupHyperbookClassState extends State<BackupHyperbookClass> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: populateHyperbook(widget.hyperbook),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: SizedBox(
                    width: 50, height: 50, child: Text(snapshot.data!)));
          } else {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          }
        });
  }
}
