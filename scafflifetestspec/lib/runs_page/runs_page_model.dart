import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'runs_page_widget.dart' show RunsPageWidget;
import 'package:flutter/material.dart';

class RunsPageModel extends FlutterFlowModel<RunsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in TestsPage widget.
  RunsRecord? query1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
