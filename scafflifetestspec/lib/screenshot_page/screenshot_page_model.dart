import '/flutter_flow/flutter_flow_util.dart';
import 'screenshot_page_widget.dart' show ScreenshotPageWidget;
import 'package:flutter/material.dart';

class ScreenshotPageModel extends FlutterFlowModel<ScreenshotPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
