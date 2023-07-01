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

import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/foundation.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../chapter_read/chapter_read_widget.dart';
import 'get_chapters.dart';
import 'permissions.dart';
import 'dart:math';
import 'button_change_chapter_state.dart';

class DisplayChapterHtml extends StatefulWidget {
  const DisplayChapterHtml({
    Key? key,
    this.width,
    this.height,
    this.body,
    this.hyperbook,
    this.user,
    this.chapter,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? body;
  final DocumentReference? hyperbook;
  final DocumentReference? user;
  final DocumentReference? chapter;

  @override
  _DisplayChapterHtmlState createState() => _DisplayChapterHtmlState();
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {
  // optional: override getter to configure how WebViews are built
  bool get webViewMediaPlaybackAlwaysAllow => true;
  String? get webViewUserAgent => 'My app';
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class _DisplayChapterHtmlState extends State<DisplayChapterHtml> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //GetChapters(
        //   width: 100,
        //  height: 100,
        //  hyperbook: widget.hyperbook!,
        //  user: widget.user!),
        //   Expanded(child:
        child: HtmlWidget(
      widget.body!,
      onTapUrl: (String value) async {
        // chapterList = List.from(FFAppState().hyperbookChapterList);
        // readReferenceList = List.from(FFAppState().userReadReferenceList);
        print(
            '(D44-1)${readReferenceList}£${value}*${widget.hyperbook}%${chapterList}');

        int chapterIndex = -1;
        if ((chapterList != null) && (chapterList!.length > 0)) {
          for (int i = 0; i < chapterList!.length; i++) {
            // print('(D44-2)${i}^${chapterList![i].ffRef!.path}*');
            if (value == ('#' + chapterList![i].reference!.path)) {
              chapterIndex = i;
              break;
            }
          }
        }

        print(
            '(D44-10)${chapterIndex}*${chapterList![chapterIndex].reference}%${chapterList}');
        if (chapterIndex != -1) {
          changeChapterState(
            context,
            chapterList![chapterIndex].reference,
            widget.hyperbook,
            null,
            widget.user,
            1,
            true,
            true,
          );
        }
        return true;
      },
      factoryBuilder: () => MyWidgetFactory(),
    )
        // )
        // ])

        );
  }
}
