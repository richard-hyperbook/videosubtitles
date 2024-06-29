import '/flutter_flow/flutter_flow_util.dart';
import 'tests_item_widget.dart' show TestsItemWidget;
import 'package:flutter/material.dart';

class TestsItemModel extends FlutterFlowModel<TestsItemWidget> {
  ///  Local state fields for this component.

  String? testNameLocal;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
