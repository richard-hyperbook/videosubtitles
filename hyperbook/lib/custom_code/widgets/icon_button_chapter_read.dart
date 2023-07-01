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
// Begin custom widget code
// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

import '../../chapter_read/chapter_read_widget.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/custom_icons.dart';
import '../../custom_code/widgets/index.dart' as custom_widgets;
import '../../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button_change_chapter_state.dart';

class IconButtonChapterRead extends StatefulWidget {
  const IconButtonChapterRead({
    Key? key,
    this.width,
    this.height,
    this.hyperbook,
    this.hyperbookTitle,
    this.chapter,
    this.chapterTitle,
    this.body,
    this.user,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? hyperbook;
  final String? hyperbookTitle;
  final DocumentReference? chapter;
  final String? chapterTitle;
  final String? body;
  final DocumentReference? user;

  @override
  _IconButtonChapterReadState createState() => _IconButtonChapterReadState();
}

class _IconButtonChapterReadState extends State<IconButtonChapterRead> {
  ReadReferencesRecord? readReferenceFound;

  Widget readIconButton() {
    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30,
      borderWidth: 1,
      buttonSize: 40,
      icon: Icon(
        FFIcons.keye,
        color: Color(0xD5000000),
        size: 30,
      ),
      onPressed: () async {
        print(
            '(D101-1)${widget.chapter}%${widget.chapterTitle}>${readReferenceFound}');

        await changeChapterState(
          context,
          widget.chapter,
          widget.hyperbook,
          null,
          widget.user,
          1,
          true,
          true,
        );

/*

        context,
        DocumentReference? chapter,
        DocumentReference? hyperbook,
        DocumentReference? readReference,
        DocumentReference? user,
        int? newState,
        bool ifExistNoChange,
        bool ifReadNewChapter,
*/

        print(
            '(D101-4)${widget.chapter}%${widget.chapterTitle}>${readReferenceFound}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('(D102)${widget.chapter}%${widget.chapterTitle}');

    return readIconButton();
  }
}
