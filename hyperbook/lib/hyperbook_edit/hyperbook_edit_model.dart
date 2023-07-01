import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HyperbookEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for title widget.
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for blurb widget.
  TextEditingController? blurbController;
  String? Function(BuildContext, String?)? blurbControllerValidator;
  // State field(s) for ChoiceChipsVisibility widget.
  String? choiceChipsVisibilityValue;
  FormFieldController<List<String>>? choiceChipsVisibilityValueController;
  // State field(s) for ChoiceChipsReader widget.
  String? choiceChipsReaderValue;
  FormFieldController<List<String>>? choiceChipsReaderValueController;
  // State field(s) for ChoiceChipsCollaborator widget.
  String? choiceChipsCollaboratorValue;
  FormFieldController<List<String>>? choiceChipsCollaboratorValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    titleController?.dispose();
    blurbController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
