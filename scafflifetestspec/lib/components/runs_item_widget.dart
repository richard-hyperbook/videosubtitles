import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'runs_item_model.dart';
export 'runs_item_model.dart';

class RunsItemWidget extends StatefulWidget {
   RunsItemWidget({
    super.key,
    required this.index,
    required this.testsRefParam,
    required this.testNameParam,
    required this.dateCreatedParam,
    required this.dateModifiedParam,
  });

  final int? index;
  final DocumentReference? testsRefParam;
  final String? testNameParam;
  final DateTime? dateCreatedParam;
  final DateTime? dateModifiedParam;

  String? passFail;
  String? note;

  @override
  State<RunsItemWidget> createState() => _RunsItemWidgetState();
}

class _RunsItemWidgetState extends State<RunsItemWidget> {
  late RunsItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RunsItemModel());

    // _model.textController ??= TextEditingController(text: widget.runNameParam);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  const Duration(milliseconds: 2000),
                      () async {
                    _model.runNameLocal = _model.textController.text;
                    setState(() {});
                  },
                ),
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Test name...',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Text(
              dateTimeFormat('d/M/y', widget.dateCreatedParam),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0.0,
              ),
            ),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Text(
              dateTimeFormat('d/M/y', widget.dateModifiedParam),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0.0,
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              FFAppState().parentTestRefGlobal = widget.testsRefParam;
              FFAppState().parentTestNameGlobal = widget.testNameParam!;
              _model.updatePage(() {});

              context.pushNamed('TestStepsPage');
            },
            text: 'Edit Test Steps',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                letterSpacing: 0.0,
              ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await widget.testsRefParam!.update(createTestsRecordData(
                testName: _model.textController.text,
                dateCreated: widget.dateCreatedParam,
                dateModified: getCurrentTimestamp,
              ));
            },
            text: 'Save',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                letterSpacing: 0.0,
              ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: const Text('Delete Test'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: const Text('Confirm'),
                      ),
                    ],
                  );
                },
              ) ??
                  false;
              if (confirmDialogResponse) {
                await widget.testsRefParam!.delete();

                context.pushNamed('HomePage');
              } else {
                context.safePop();
              }
            },
            text: 'Delete',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                letterSpacing: 0.0,
              ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
