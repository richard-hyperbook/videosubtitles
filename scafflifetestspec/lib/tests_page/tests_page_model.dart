import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tests_page_widget.dart' show TestsPageWidget;
import 'package:flutter/material.dart';

class TestsPageModel extends FlutterFlowModel<TestsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in TestsPage widget.
  TestsRecord? query1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
