import '/flutter_flow/flutter_flow_util.dart';
import 'runs_item_widget.dart' show RunsItemWidget;
import 'package:flutter/material.dart';

class RunsItemModel extends FlutterFlowModel<RunsItemWidget> {
  ///  Local state fields for this component.

  String? runNameLocal;

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
