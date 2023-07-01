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

class DisplayHyperbookModerator extends StatefulWidget {
  const DisplayHyperbookModerator({
    Key? key,
    this.width,
    this.height,
    this.moderator,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? moderator;

  @override
  _DisplayHyperbookModeratorState createState() =>
      _DisplayHyperbookModeratorState();
}

class _DisplayHyperbookModeratorState extends State<DisplayHyperbookModerator> {
  UsersRecord? moderatorRec;

  Future<UsersRecord> populateModerator() async {
    print('(D211-2)${widget.moderator!.path}');
    return moderatorRec = await UsersRecord.getDocumentOnce(widget.moderator!);
    print('(D211-3)${moderatorRec}');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: populateModerator(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print('(D211-4)${snapshot}@${widget.moderator}%${moderatorRec}>');
            return Text(
              moderatorRec!.displayName!,
              style: FlutterFlowTheme.of(context).bodyText1,
            );
          } else {
            return Text(
              'Unknown',
              style: FlutterFlowTheme.of(context).bodyText1,
            );
          }
        });
  }
}
