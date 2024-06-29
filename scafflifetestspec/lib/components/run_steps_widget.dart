import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'test_steps_item_model.dart';
export 'test_steps_item_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RunStepsItemWidget extends StatefulWidget {
  RunStepsItemWidget({
    super.key,
    required this.index,
    required this.descriptionParam,
    required this.passCriteraiParam,
    required this.screenshotParam,
    required this.testStepItemRef,
    this.testParentRefParam,
    this.testRunRef,
  });

  final double? index;
  final String? descriptionParam;
  final String? passCriteraiParam;
  final String? screenshotParam;
  final DocumentReference? testStepItemRef;
  final DocumentReference? testParentRefParam;
  final RunsRecord? testRunRef;

  String? passFail;
  String? note;

  @override
  State<RunStepsItemWidget> createState() => _RunStepsItemWidgetState();
}

class _RunStepsItemWidgetState extends State<RunStepsItemWidget> {
  late TestStepsItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestStepsItemModel());

    _model.textController1 ??= TextEditingController(
        text: formatNumber(
      widget.index,
      formatType: FormatType.decimal,
      decimalType: DecimalType.automatic,
    ));
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.descriptionParam);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??=
        TextEditingController(text: widget.passCriteraiParam);
    _model.textFieldFocusNode3 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;

  set choiceChipsValue(String? val) {
    choiceChipsValueController?.value = val != null ? [val] : [];
    widget.passFail = val;
  }

  // static const double kButtonTextHeight = 20;

  Widget addScreenshotButton() {
    return FFButtonWidget(
      onPressed: () async {
        final selectedMedia = await selectMedia(
          mediaSource: MediaSource.photoGallery,
          multiImage: false,
        );
        print('(L1)${selectedMedia}');
        if (selectedMedia != null &&
            selectedMedia
                .every((m) => validateFileFormat(m.storagePath, context))) {
          setState(() => _model.isDataUploading = true);
          var selectedUploadedFiles = <FFUploadedFile>[];
          print('(L2)${selectedUploadedFiles}');
          try {
            showUploadMessage(
              context,
              'Uploading file...',
              showLoading: true,
            );
            print('(L3)${selectedUploadedFiles}');
            selectedUploadedFiles = selectedMedia
                .map((m) => FFUploadedFile(
                      name: m.storagePath.split('/').last,
                      bytes: m.bytes,
                      height: m.dimensions?.height,
                      width: m.dimensions?.width,
                      blurHash: m.blurHash,
                    ))
                .toList();
          } finally {
            print('(L4)${selectedUploadedFiles}');
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _model.isDataUploading = false;
            print('(L5)');
          }
          print('(L6A)${selectedMedia}');

          if (selectedUploadedFiles.length == selectedMedia.length) {
            setState(() {
              _model.uploadedLocalFile = selectedUploadedFiles.first;
            });
            showUploadMessage(context, 'Success!');
          } else {
            setState(() {});
            showUploadMessage(context, 'Failed to upload data');
            return;
          }
        }
        String storagePathname = 'S' + widget.testStepItemRef!.id;
        print('(L6B)${storagePathname}');
        firebase_storage.FirebaseStorage.instance
            // fb .storage()
            .ref(storagePathname)
            .putData(selectedMedia!.first.bytes)
            .then((snapshot2) {
          snapshot2.ref.getDownloadURL().then((snapshot3) async {
            print('(L6C)${snapshot2}+${snapshot3}');
            Map<String, dynamic> documentData = {};
            print('(L10)${storagePathname}');
            await widget.testStepItemRef!.update(createTestStepsRecordData(
              screenshot: snapshot3,
            ));
            print('(L7)${widget.screenshotParam}');

            /*  firestoreUpdateData(
                        kDatabaseCompaniesName, idJJobOrCompany, documentData);
                  } else {
                    jobData['photos']![0] =
                        jobData['photos']![0] + snapshot3.toString() + ',';
                    //> print('(I4407B)');
                    documentData['photos'] = jobData['photos']![0];
                    firestoreUpdateData(
                        jobsContainerName(context), idJJobOrCompany, documentData);*/
          });
        }).catchError((e) {
          print('(L11)${e}');
        });

        //> print('(I4409)$e');

        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Screenshot saved'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
      },
      text: 'Add screenshot',
      options: FFButtonOptions(
        height: kButtonHeight,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
              letterSpacing: 0.0,
              // lineHeight: kButtonTextHeight,
            ),
        elevation: 3.0,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  Widget saveButton() {
    return FFButtonWidget(
      onPressed: () async {
        await widget.testStepItemRef!.update(createTestStepsRecordData(
          parentTest: widget.testParentRefParam,
          index: double.tryParse(_model.textController1.text),
          description: _model.textController2.text,
          screenshot: '',
          passCriteria: _model.textController3.text,
        ));
        print('(L7)${widget.testStepItemRef}');
      },
      text: 'Save',
      options: FFButtonOptions(
        height: kButtonHeight,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
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
    );
  }

  Widget passFailChoiceChips(int index) {
    return FlutterFlowChoiceChips(
      options: [
        ChipData('Fail', Icons.close),
        ChipData('Pass', Icons.check),
        ChipData('Unknown', Icons.device_unknown)
      ],
      onChanged: (val) {
        setState(() => choiceChipsValue = val?.firstOrNull);
        print('(L90)${index}*${val}');
        widget.testRunRef!.passFail[index] = val![0];
        print('(L91)${widget.testRunRef!.passFail}');
      },
      selectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0,
            ),
        iconColor: FlutterFlowTheme.of(context).primaryText,
        iconSize: 18,
        elevation: 4,
        borderRadius: BorderRadius.circular(16),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).secondaryText,
              letterSpacing: 0,
            ),
        iconColor: FlutterFlowTheme.of(context).secondaryText,
        iconSize: 18,
        elevation: 0,
        borderRadius: BorderRadius.circular(16),
      ),
      chipSpacing: 12,
      rowSpacing: 12,
      multiselect: false,
      alignment: WrapAlignment.start,
      controller: choiceChipsValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      wrapped: true,
    );
  }

  /*

  Widget deleteButton() {
    return FFButtonWidget(
      onPressed: () async {
        var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Delete Step'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: const Text('Confirm'),
                ),
              ],
            );
          },
        ) ??
            false;
        if (confirmDialogResponse) {
          await widget.testStepItemRef!.delete();
          FFAppState().nextTestStepIndex =
              random_data.randomDouble(0.0, 1000.0);
          FFAppState().update(() {});

          context.pushNamed('TestStepsPage');
        } else {
          context.safePop();
        }
      },
      text: 'Delete',
      options: FFButtonOptions(
        height: kButtonHeight,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
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
    );
  }
*/

  Widget viewScreenshotButton() {
    return FFButtonWidget(
      onPressed: () async {
        context.pushNamed(
          'ScreenshotPage',
          queryParameters: {
            'screenshotPath': serializeParam(
              widget.screenshotParam,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
      text: 'View screenshot',
      options: FFButtonOptions(
        height: kButtonHeight,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
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
    );
  }

  static const double runStepRowHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: runStepRowHeight,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 100.0,
            height: runStepRowHeight,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              border: Border.all(width: 1, color: Colors.blue),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Text(widget.index!.toString()),
            ),
          ),
          Container(
            width: 400.0,
            height: runStepRowHeight,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              border: Border.all(width: 1, color: Colors.blue),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Text(widget.descriptionParam!),
            ),
          ),
          Container(
            width: 200.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              border: Border.all(width: 1, color: Colors.blue),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Text(widget.passCriteraiParam!),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              passFailChoiceChips((widget.index!).round()),
              // saveButton(),
              // addScreenshotButton(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              viewScreenshotButton(),
              // deleteButton(),
            ],
          ),
        ],
      ),
    );
  }
}
