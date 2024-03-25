import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'edit_issue_model.dart';
export 'edit_issue_model.dart';

class EditIssueWidget extends StatefulWidget {
  const EditIssueWidget({
    super.key,
    required this.issueParam,
  });

  final Issues2Record? issueParam;

  @override
  State<EditIssueWidget> createState() => _EditIssueWidgetState();
}

class _EditIssueWidgetState extends State<EditIssueWidget> {
  late EditIssueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditIssueModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().dateRaised = widget.issueParam?.dateRaised;
        FFAppState().dateFixed = widget.issueParam?.dateFixed;
      });
      setState(() {
        FFAppState().dateFixed = widget.issueParam?.dateFixed;
      });
      setState(() {
        FFAppState().currentIssueReference = widget.issueParam?.reference;
      });
      setState(() {
        FFAppState().issueTitleChanged = false;
        FFAppState().issueDescriptionChanged = false;
        FFAppState().dateRaisedChanged = false;
        FFAppState().versionSoftwareFixedChanged = false;
        FFAppState().versionSoftwareRaisedChanged = false;
        FFAppState().dateFixedChanged = false;
        FFAppState().statusChanged = false;
        FFAppState().notesChanged = false;
        FFAppState().ticketNumberChanged = false;
        FFAppState().raisedByChanged = false;
        FFAppState().urgencyChanged = false;
        FFAppState().screenshotChanged = false;
      });
      setState(() {
        FFAppState().issueTitleChanged = false;
      });
    });

    _model.textController1 ??=
        TextEditingController(text: widget.issueParam?.issueTitle);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.issueParam?.issueDescription);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(
        text: widget.issueParam?.versionSoftwareRaised.toString());
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: widget.issueParam?.notes);
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController(
        text: widget.issueParam?.versionSoftwareFixed.toString());
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??=
        TextEditingController(text: widget.issueParam?.raisedBy);
    _model.textFieldFocusNode6 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Edit Scafflife Issue',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ticket number: ${widget.issueParam?.ticketNumber.toString()}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 20.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Status ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 18.0,
                          ),
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController1 ??=
                          FormFieldController<String>(
                        _model.dropDownValue1 ??= widget.issueParam?.status,
                      ),
                      options: const ['Current', 'Fixed', 'Deferred'],
                      onChanged: (val) async {
                        setState(() => _model.dropDownValue1 = val);
                        setState(() {
                          FFAppState().statusChanged = true;
                        });
                      },
                      width: 300.0,
                      height: 40.0,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      hintText: 'Status',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                    Text(
                      ' | ',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      'Urgency ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 18.0,
                          ),
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController2 ??=
                          FormFieldController<String>(
                        _model.dropDownValue2 ??= widget.issueParam?.urgency,
                      ),
                      options: const ['Low', 'Medium', 'High'],
                      onChanged: (val) async {
                        setState(() => _model.dropDownValue2 = val);
                        setState(() {
                          FFAppState().urgencyChanged = true;
                        });
                      },
                      width: 300.0,
                      height: 40.0,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      hintText: 'Status',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController1',
                      const Duration(milliseconds: 2000),
                      () async {
                        setState(() {
                          FFAppState().issueTitleChanged = true;
                        });
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Issue title',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textController1Validator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController2',
                      const Duration(milliseconds: 2000),
                      () async {
                        setState(() {
                          FFAppState().issueDescriptionChanged = true;
                        });
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Issue description',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: 5,
                    validator:
                        _model.textController2Validator.asValidator(context),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    final datePicked1Date = await showDatePicker(
                      context: context,
                      initialDate: (FFAppState().dateRaised ?? DateTime.now()),
                      firstDate: (FFAppState().dateRaised ?? DateTime.now()),
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24.0,
                        );
                      },
                    );

                    if (datePicked1Date != null) {
                      safeSetState(() {
                        _model.datePicked1 = DateTime(
                          datePicked1Date.year,
                          datePicked1Date.month,
                          datePicked1Date.day,
                        );
                      });
                    }
                    setState(() {
                      FFAppState().dateRaised = _model.datePicked1;
                    });
                    setState(() {
                      FFAppState().dateRaisedChanged = true;
                    });
                  },
                  text:
                      'Date Raised ${dateTimeFormat('d/M/y', FFAppState().dateRaised)}',
                  options: FFButtonOptions(
                    height: 30.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController3,
                    focusNode: _model.textFieldFocusNode3,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController3',
                      const Duration(milliseconds: 2000),
                      () async {
                        setState(() {
                          FFAppState().versionSoftwareRaisedChanged = true;
                        });
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Software version when raised',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textController3Validator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController4,
                    focusNode: _model.textFieldFocusNode4,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController4',
                      const Duration(milliseconds: 2000),
                      () async {
                        setState(() {
                          FFAppState().notesChanged = true;
                        });
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Notes',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: 5,
                    validator:
                        _model.textController4Validator.asValidator(context),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    final datePicked2Date = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24.0,
                        );
                      },
                    );

                    if (datePicked2Date != null) {
                      safeSetState(() {
                        _model.datePicked2 = DateTime(
                          datePicked2Date.year,
                          datePicked2Date.month,
                          datePicked2Date.day,
                        );
                      });
                    }
                    setState(() {
                      FFAppState().dateFixed = _model.datePicked2;
                    });
                    setState(() {
                      FFAppState().dateFixedChanged = true;
                    });
                  },
                  text:
                      'Date Fixed ${dateTimeFormat('d/M/y', FFAppState().dateFixed)}',
                  options: FFButtonOptions(
                    height: 30.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController5,
                    focusNode: _model.textFieldFocusNode5,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController5',
                      const Duration(milliseconds: 2000),
                      () async {
                        setState(() {
                          FFAppState().versionSoftwareFixedChanged = true;
                        });
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Software version when fixed',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textController5Validator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController6,
                    focusNode: _model.textFieldFocusNode6,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController6',
                      const Duration(milliseconds: 2000),
                      () async {
                        setState(() {
                          FFAppState().raisedByChanged = true;
                        });
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Raised by',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textController6Validator.asValidator(context),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await widget.issueParam!.reference
                        .update(createIssues2RecordData(
                      issueTitle: _model.textController1.text,
                      issueDescription: _model.textController2.text,
                      versionSoftwareRaised:
                          int.tryParse(_model.textController3.text),
                      versionSoftwareFixed:
                          int.tryParse(_model.textController5.text),
                      status: _model.dropDownValue1,
                      urgency: _model.dropDownValue2,
                      notes: _model.textController4.text,
                      ticketNumber: widget.issueParam?.ticketNumber,
                      raisedBy: _model.textController6.text,
                      dateRaised: FFAppState().dateRaised,
                      dateFixed: FFAppState().dateFixed,
                    ));
                    if (FFAppState().dateFixedChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 6,
                            action: dateTimeFormat('d/M/y', _model.datePicked2),
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }
                    if (FFAppState().urgencyChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 11,
                            action: _model.dropDownValue2,
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }
                    if (FFAppState().raisedByChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 10,
                            action: _model.textController6.text,
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }
                    if (FFAppState().statusChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 7,
                            action: _model.dropDownValue1,
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }
                    if (FFAppState().versionSoftwareRaisedChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 4,
                            action: _model.textController3.text,
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }
                    if (FFAppState().versionSoftwareFixedChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 5,
                            action: _model.textController5.text,
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }
                    if (FFAppState().dateRaisedChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            parent: widget.issueParam?.reference,
                            action: dateTimeFormat(
                                'd/M/y HH:mm', _model.datePicked1),
                            index: 3,
                            dateTime: getCurrentTimestamp,
                          ));
                    }
                    if (FFAppState().issueDescriptionChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 2,
                            action: _model.textController2.text,
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }
                    if (FFAppState().issueTitleChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 1,
                            action: _model.textController1.text,
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }
                    if (FFAppState().notesChanged) {
                      await HistoryCollectionRecord.collection
                          .doc()
                          .set(createHistoryCollectionRecordData(
                            index: 8,
                            action: _model.textController4.text,
                            dateTime: getCurrentTimestamp,
                            parent: widget.issueParam?.reference,
                          ));
                    }

                    context.pushNamed('HomePage');
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
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
          ),
        ),
      ),
    );
  }
}
