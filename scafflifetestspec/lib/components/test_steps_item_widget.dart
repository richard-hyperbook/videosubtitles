import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'test_steps_item_model.dart';
export 'test_steps_item_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class TestStepsItemWidget extends StatefulWidget {
  TestStepsItemWidget({
    super.key,
    required this.index,
    required this.testParentNameParam,
    required this.descriptionParam,
    required this.passCriteraiParam,
    required this.screenshotParam,
    required this.testStepItemRef,
    this.testParentRefParam,
  });

  final double? index;
  final String? testParentNameParam;
  final String? descriptionParam;
  final String? passCriteraiParam;
  final String? screenshotParam;
  final DocumentReference? testStepItemRef;
  final DocumentReference? testParentRefParam;

  String? passFail;
  String? note;

  @override
  State<TestStepsItemWidget> createState() => _TestStepsItemWidgetState();
}

class _TestStepsItemWidgetState extends State<TestStepsItemWidget> {
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
              border: Border.all(width: 1, color: Colors.blue),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: TextFormField(
                maxLines: 1,
                controller: _model.textController1,
                focusNode: _model.textFieldFocusNode1,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Index...',
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
                validator: (value) {if (double.tryParse(value!) == null){
                  return 'Must be a number';
                }
    },
                // _model.textController1Validator.asValidator(context),
              ),
            ),
          ),
          Container(
            width: 400.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              border: Border.all(width: 1, color: Colors.blue),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: TextFormField(
                maxLines: 5,
                controller: _model.textController2,
                focusNode: _model.textFieldFocusNode2,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Description...',
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
                validator: _model.textController2Validator.asValidator(context),
              ),
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
              child: TextFormField(
                maxLines: 5,
                controller: _model.textController3,
                focusNode: _model.textFieldFocusNode3,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Pass criteria',
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
                validator: _model.textController3Validator.asValidator(context),
              ),
            ),
          ),
          SizedBox(width:20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              saveButton(),
              addScreenshotButton(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              viewScreenshotButton(),
              deleteButton(),
            ],
          ),
        ],
      ),
    );
  }
}
