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

class UpdateChapterState extends StatefulWidget {
  const UpdateChapterState({
    Key? key,
    this.width,
    this.height,
    this.chapter,
    this.hyperbook,
    this.user,
    this.minState,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? chapter;
  final DocumentReference? hyperbook;
  final DocumentReference? user;
  final int? minState;

  @override
  _UpdateChapterStateState createState() => _UpdateChapterStateState();
}

class _UpdateChapterStateState extends State<UpdateChapterState> {
  updateChapter() async {
    int index = -1;
    for (int i = 0; i < FFAppState().chaptersRead!.length; i++) {
      if (FFAppState().chaptersRead[i] == widget.chapter) {
        index = i;
        break;
      }
    }
    if (index == -1) {
      final readReferenceCreateData = createReadReferencesRecordData(
        chapter: widget.chapter,
        hyperbook: widget.hyperbook,
        readStateIndex: widget.minState,
      );

      await ReadReferencesRecord.createDoc(widget.user!)
          .set(readReferenceCreateData);
    }
  }

  @override
  Widget build(BuildContext context) {
    updateChapter();
    return Container(child: Text('RR loaded'));
  }
}
