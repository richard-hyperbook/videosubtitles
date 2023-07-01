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

// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import 'permissions.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../backend/backend.dart';

class SetIntroductionHyperbook extends StatefulWidget {
  const SetIntroductionHyperbook({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SetIntroductionHyperbookState createState() =>
      _SetIntroductionHyperbookState();
}

Future<List<HyperbooksRecord>> populateIntroductionHyperbook() async {
  print('(D831)');
  List<HyperbooksRecord> hypebookList = [];
  hypebookList = await queryHyperbooksRecordOnce(
    queryBuilder: (HyperbooksRecord) =>
        HyperbooksRecord.where('title', isEqualTo: 'Hyperbook Introduction'),
  );
  if (hypebookList.length > 0) {
    FFAppState().introductionHyperbook = hypebookList[0].reference;
  } else {
    FFAppState().introductionHyperbook = null;
  }
  return hypebookList;
}

class _SetIntroductionHyperbookState extends State<SetIntroductionHyperbook> {
  @override
  Widget build(BuildContext context) {
    print('(D830)');
    chapterList.clear();
    return FutureBuilder<void>(
        future: populateIntroductionHyperbook(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print('(D833)');
            return Container(
                width: 100,
                height: 500,
                // color: Colors.red,
                child: GetChapters(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  drawMapWhenComplete: true,
                  hyperbookTitle: FFAppState().currentChapterTitle,
                  editHtmlWhenComplete: true,
                  body: 'BBBBB',
                  chapterTitle: 'CCCCC',
                  hyperbook: FFAppState().introductionHyperbook,
                  user: null, //currentUserReference,
                  chapter: FFAppState().currentChapter,
                  isIntroductionMap: true,
                ));
          } else {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
            );
          }
        });
  }
}
