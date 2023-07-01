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
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../../main.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter/foundation.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../chapter_read/chapter_read_widget.dart';
import 'get_chapters.dart';
import 'permissions.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'CustomIcons';
  static const String? _kFontPkg = null;

  static const IconData book_1 =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData remove_red_eye =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData trash =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData edit_1 =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData local_see =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData doc_new =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData share =
      IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData eye_2 =
      IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData thumbs_up =
      IconData(0xe86d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData thumbs_down =
      IconData(0xe86e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData highlight =
      IconData(0xe897, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heart =
      IconData(0xf004, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData book =
      IconData(0xf02d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData edit =
      IconData(0xf044, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData eye =
      IconData(0xf06e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData eye_slash =
      IconData(0xf070, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData share_alt =
      IconData(0xf1e0, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData trash_alt =
      IconData(0xf2ed, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData eye_closed =
      IconData(0xf366, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData eye_1 =
      IconData(0xf3a8, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData book_open =
      IconData(0xf518, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData spread =
      IconData(0xf527, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData highlighter =
      IconData(0xf591, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData book_reader =
      IconData(0xf5da, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static const Map<String, IconData> iconMap = {
    'book_1': book_1,
    'remove_red_eye': remove_red_eye,
    'trash': trash,
    'edit_1': edit_1,
    'local_see': local_see,
    'doc_new': doc_new,
    'share': share,
    'eye_2': eye_2,
    'thumbs_up': thumbs_up,
    'thumbs_down': thumbs_down,
    'highlight': highlight,
    'heart': heart,
    'book': book,
    'edit': edit,
    'eye': eye,
    'eye_slash': eye_slash,
    'share_alt': share_alt,
    'trash_alt': trash_alt,
    'eye_closed': eye_closed,
    'eye_1': eye_1,
    'book_open': book_open,
    'spread': spread,
    'highlighter': highlighter,
    'book_reader': book_reader,
  };
}

List<DocumentReference>? _readReferenceList;

class ButtonChangeChapterState extends StatefulWidget {
  const ButtonChangeChapterState({
    Key? key,
    this.width,
    this.height,
    this.readReference,
    this.chapter,
    this.user,
    this.newState,
    this.buttonLabel,
    this.buttonIcon,
    this.hyperbook,
    this.customIconString,
    this.tooltipMessage,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? readReference;
  final DocumentReference? chapter;
  final DocumentReference? user;
  final int? newState;
  final String? buttonLabel;
  final Widget? buttonIcon;
  final DocumentReference? hyperbook;
  final String? customIconString;
  final String? tooltipMessage;

  @override
  _ButtonChangeChapterStateState createState() =>
      _ButtonChangeChapterStateState();
}

class _ButtonChangeChapterStateState extends State<ButtonChangeChapterState> {
  static const double iconSize = 25;
  static const Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    print('(D230-1)${widget.chapter}£${widget.hyperbook}');
    print(
        '(D230-11)${FFAppState().currentChapterStateIndex}£${FFAppState().chosenColors}');
    var icon = widget.buttonIcon!;
    if ((widget.customIconString != null) && (widget.customIconString! != '')) {
      icon = Icon(
        CustomIcons.iconMap[widget.customIconString!],
        size: iconSize,
        color: iconColor,
      );
    }
    return Tooltip(
        message: widget.tooltipMessage!,
        child: FlutterFlowIconButton(
            fillColor: FFAppState().chosenColors[widget.newState!],
            borderRadius: 20,
            borderWidth: 1,
            buttonSize: 40,
            icon: icon,
            onPressed: () async {
              print(
                  '(D230-2)${widget.chapter}£${widget.hyperbook}^${widget.readReference}@${widget.user}?${widget.newState}');
              changeChapterState(
                context,
                widget.chapter,
                widget.hyperbook,
                widget.readReference,
                widget.user,
                widget.newState,
                false,
                false,
              );
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    backgroundColor:
                        FFAppState().chosenColors[widget.newState!],
                    title: Text('Chapter state now = ' +
                        kChapterStateList[widget.newState!]),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child:
                            Text('OK', style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  );
                },
              );
            }));
  }
}

Future<void> changeChapterState(
  BuildContext context,
  DocumentReference? chapter,
  DocumentReference? hyperbook,
  DocumentReference? readReference,
  DocumentReference? user,
  int? newState,
  bool ifExistNoChange,
  bool ifReadNewChapter,
) async {
  List<ReadReferencesRecord> _readReferenceList = [];
  int finalState = newState!;
  print('(D231)${newState}?${chapter}£${ifExistNoChange}+${ifReadNewChapter}');
  bool isNewState = false;
  if (readReference != null) {
    final readReferencesUpdateData = createReadReferencesRecordData(
      readStateIndex: newState,
    );
    print('(D232)');
    if (!ifExistNoChange) {
      await readReference.update(readReferencesUpdateData);
      isNewState = true;
    }
    print('(D233)');
  } else {
    _readReferenceList = await queryReadReferencesRecordOnce(
      parent: user,
      queryBuilder: (ReadReferencesRecord) =>
          ReadReferencesRecord.where('chapter', isEqualTo: chapter),
    );
    print('(D234)${_readReferenceList.length}^${chapter}');
    if ((_readReferenceList == null) || (_readReferenceList.length == 0)) {
      print('(D235)');

      final readReferencesCreateData = createReadReferencesRecordData(
        chapter: chapter,
        readStateIndex: newState,
        hyperbook: hyperbook,
      );
      print('(D236)${readReferencesCreateData}');

      await ReadReferencesRecord.createDoc(user!).set(readReferencesCreateData);
      isNewState = true;
      print('(D237)');
    } else {
      final readReferencesUpdateData = createReadReferencesRecordData(
        readStateIndex: newState,
      );
      print('(D238)${newState}');
      if (!ifExistNoChange) {
        await readReference!.update(readReferencesUpdateData);
        finalState = newState;
      } else {
        if (_readReferenceList.length > 0) {
          finalState = _readReferenceList[0].readStateIndex!;
        }
      }
      print('(D240)');
    }
  }

  if (ifReadNewChapter) {
    ChaptersRecord chapterRec;
    chapterRec = await ChaptersRecord.getDocumentOnce(chapter!);
    print('(D241)');

    HyperbooksRecord hyperbookRec;
    hyperbookRec = await HyperbooksRecord.getDocumentOnce(hyperbook!);
    print('(D242)');

    if ((readReference != null) && (ifExistNoChange)) {
      ReadReferencesRecord readReferenceRec;
      readReferenceRec =
          await ReadReferencesRecord.getDocumentOnce(readReference!);
      finalState = readReferenceRec.readStateIndex!;
      print('(D243)${finalState}');
    }

    await Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
        reverseDuration: Duration(milliseconds: 300),
        child: ChapterReadWidget(
          chapter: chapter,
          title: chapterRec.title,
          body: chapterRec.body,
          hyperbookTitle: hyperbookRec.title,
          hyperbook: hyperbook,
          chapterState: finalState,
          readReference: readReference,
          chosenColors: FFAppState().chosenColors.toList(),
        ),
      ),
    );
  }
}
