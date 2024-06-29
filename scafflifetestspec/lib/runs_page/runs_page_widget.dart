import '/backend/backend.dart';
import '/components/tests_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'runs_page_model.dart';
import '/index.dart';
export 'runs_page_model.dart';

class RunsPageWidget extends StatefulWidget {
  const RunsPageWidget({super.key});

  @override
  State<RunsPageWidget> createState() => _RunsPageWidgetState();
}

class _RunsPageWidgetState extends State<RunsPageWidget> {
  late RunsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RunsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.query1 = await queryTestsRecordOnce(
        queryBuilder: (testsRecord) => testsRecord.where(
          'testName',
          isEqualTo: 'Application Test',
        ),
        singleRecord: true,
      ).then((s) => /*s.firstOrNull*/ null);
      FFAppState().parentTestRefGlobal = _model.query1?.reference;
      // FFAppState().parentTestNameGlobal = _model.query1!.dateRun;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  String testName = '';

  void getTestName(String ref) async {
    String ref2 = ref.substring(6);
    print('(L73A)${ref}%${ref2}');
    DocumentReference<Map<String, dynamic>> doc =
        FirebaseFirestore.instance.doc(ref);
    // testName = doc.
    // print('(L73B)${testName}');
  }

  /*Widget saveButton() {
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
*/

  Widget runTestButton({
    /*RunsRecord?*/ DocumentReference<Object?>? testRun,
    List<dynamic>? passFails,
    List<dynamic>? notesParam,
    DocumentReference? testParentRef,
  }) {
    print('(L150)');
    return FFButtonWidget(
      onPressed: () {
        // FFAppState().parentTestRefGlobal = widget.testsRefParam;
        // FFAppState().parentTestNameGlobal = widget.testNameParam!;
        List<String> passFailsString = [];
        for (dynamic pF in passFails!) {
          passFailsString.add(pF as String);
        }
        List<String> notesParamString = [];
        for (dynamic n in notesParam!) {
          notesParamString.add(n as String);
        }
        //testRunGlobal = testRun;
        passFailsGlobal = passFailsString;
        notesParamGlobal = notesParamString;
        testParentRefGlobal = testParentRef;
        print('(L151)');
        context.pushNamed('RunStepsPage');
        /*  RunStepsPageWidget(

              testRunParam: testRunGlobal,
              passFailsParam: passFailsString,
              notesParam: notesParamString,
              testParentRefParam: testParentRef,

            );

*/

        print('(L77)');
      },
      text: 'Run Test',
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

  Widget deleteRunButton({
    /*RunsRecord?*/ DocumentReference<Object?>? testRun,
    List<dynamic>? passFails,
    List<dynamic>? notesParam,
    DocumentReference? testParentRef,
  }) {
    print('(L180)');
    return FFButtonWidget(
      onPressed: () async {
        // FFAppState().parentTestRefGlobal = widget.testsRefParam;
        // FFAppState().parentTestNameGlobal = widget.testNameParam!;

        /*  RunStepsPageWidget(

              testRunParam: testRunGlobal,
              passFailsParam: passFailsString,
              notesParam: notesParamString,
              testParentRefParam: testParentRef,

            );

*/
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: const Text('Delete Test'),
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
          await testRun!.delete();

          // context.pushNamed('HomePage');
        }
        context.safePop();
        print('(L181)');
      },
      text: 'Delete Run',
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
    context.watch<FFAppState>();
    final Stream _runsStream =
        FirebaseFirestore.instance.collection('TestRuns').snapshots();
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
            'Runs Page',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Runs',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await TestsRecord.collection
                          .doc()
                          .set(createTestsRecordData(
                            testName: '?',
                            dateCreated: getCurrentTimestamp,
                            dateModified: getCurrentTimestamp,
                          ));
                    },
                    text: 'Add Run',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
              Container(
                height: 500,
                /*      child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('TestRuns')
                        .snapshots(),
          */

                child: StreamBuilder<List<RunsRecord>>(
                    stream: queryRunsRecord(
                      queryBuilder: (runssRecord) =>
                          runssRecord.orderBy('dateRun'),
                      limit: 10,
                    ),
                    builder: (BuildContext context,
                        /*AsyncSnapshot<QuerySnapshot> */ snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      print('(L130)${snapshot.data!.length}');
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            // children: snapshot.data!.docs
                            //     .map((DocumentSnapshot document) {
                            //   Map<String, dynamic> data =
                            //       document.data()! as Map<String, dynamic>;
                            //   print('(L71)${(data['parentTest'] as DocumentReference).id}');;
                            //   getTestName((data['parentTest'] as DocumentReference).path);
                            print(
                                '(L140)${index}??????${snapshot.data![0].dateRun}%%%%%%%${snapshot.data![1].dateRun}*${snapshot.data![index].dateRun}');
                            print('(L141)${snapshot.data![index].reference}');
                            print('(L142)${snapshot.data![index].passFail}');
                            print('(L143)${snapshot.data![index].note}');
                            print('(L144)${snapshot.data![index].parentTest}');
                            return Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                          width: 200.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            border: Border.all(
                                                width: 1, color: Colors.blue),
                                          ),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      8.0, 8.0, 8.0, 8.0),
                                              child: Column(children: [
                                                Text(DateFormat('dd-MM-yyyy')
                                                    .format((snapshot
                                                        .data![index]
                                                        .dateRun)!)),
                                                // Text(
                                                //     parentTestsListGlobal[index]
                                                //         .testName),
                                              ]))),
                                      Container(
                                          width: 200.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            border: Border.all(
                                                width: 1, color: Colors.blue),
                                          ),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      8.0, 8.0, 8.0, 8.0),
                                              child: runTestButton(
                                                testRun: snapshot.data![index]
                                                    .reference /* as RunsRecord*/,
                                                passFails: snapshot
                                                    .data![index].passFail,
                                                notesParam:
                                                    snapshot.data![index].note,
                                                testParentRef: snapshot
                                                    .data![index].parentTest,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      8.0, 8.0, 8.0, 8.0),
                                              child: deleteRunButton(
                                                  testRun: snapshot
                                                      .data![index].reference),
                                            )
                                          ]))
                                    ]));
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
