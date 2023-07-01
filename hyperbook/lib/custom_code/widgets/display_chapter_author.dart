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
import '../../custom_code/widgets/index.dart' as custom_widgets;
import '../../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayChapterAuthor extends StatefulWidget {
  const DisplayChapterAuthor({
    Key? key,
    this.width,
    this.height,
    this.author,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? author;

  @override
  _DisplayChapterAuthorState createState() => _DisplayChapterAuthorState();
}

class _DisplayChapterAuthorState extends State<DisplayChapterAuthor> {
  UsersRecord? authorRec;

  Future<UsersRecord> populateAuthor() async {
    print('(D111-2)${widget.author!.path}');
    return authorRec = await UsersRecord.getDocumentOnce(widget.author!);
    print('(D111-3)${authorRec}');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: populateAuthor(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print('(D111-4)${snapshot}@${widget.author}%${authorRec}>');
            return Text(
              authorRec!.displayName!,
              style: FlutterFlowTheme.of(context).bodyText1,
            );
          } else {
            print('(D111-5)${widget.author}%${authorRec}');
            return Text(
              'Unknown',
              style: FlutterFlowTheme.of(context).bodyText1,
            );
          }
        });
  }
}
