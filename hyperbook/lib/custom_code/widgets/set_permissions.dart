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

import 'permissions.dart';

class SetPermissions extends StatefulWidget {
  const SetPermissions({
    Key? key,
    this.width,
    this.height,
    this.requiresReaderApproval,
    this.requiresColaboratorApproval,
    this.visibility,
    this.maxRole,
    this.hyperbook,
    this.approvedHyperbookReads,
    this.approvedHyperbookCollabotates,
    this.index,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? requiresReaderApproval;
  final String? requiresColaboratorApproval;
  final String? visibility;
  final String? maxRole;
  final DocumentReference? hyperbook;
  final List<DocumentReference>? approvedHyperbookReads;
  final List<DocumentReference>? approvedHyperbookCollabotates;
  final int? index;

  @override
  _SetPermissionsState createState() => _SetPermissionsState();
}

class _SetPermissionsState extends State<SetPermissions> {
  @override
  Widget build(BuildContext context) {
    bool canRead = false;
    if (widget.requiresReaderApproval! == kRRA2) {
      canRead = true;
    }
    FFAppState().canRead[widget.index!] = canRead;
    FFAppState().canReadCurrentHyperbook = canRead;

    return Text('X');
  }
}
