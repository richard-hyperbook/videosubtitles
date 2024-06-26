import '/backend/backend.dart';
import '/components/tests_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/components/run_steps_widget.dart';
// import 'runs_page/runs_page_model.dart';
// export 'tests_page_model.dart';

class RunStepsPageWidget extends StatefulWidget {
  const RunStepsPageWidget({
    super.key,
    required this.testRunParam,
    required this.passFailsParam,
    required this.notesParam,
    this.testParentRefParam,
  });

  final DocumentReference? testRunParam;
  final List<bool>? passFailsParam;
  final List<String>? notesParam;
  final DocumentReference? testParentRefParam;


  @override
  State<RunStepsPageWidget> createState() => _RunStepsPageWidgetState();
}

class _RunStepsPageWidgetState extends State<RunStepsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Run Steps Page',
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
                      'Run Steps',
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
                      text: 'Next',
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
                StreamBuilder<List<TestStepsRecord>>(
                  stream: queryTestStepsRecord(
                    queryBuilder: (testStepsRecord) =>
                        testStepsRecord.orderBy('index'),
                    //limit: 10,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
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
                    List<TestStepsRecord> listViewTestStepsRecordList = snapshot.data!;
                    // if (listViewTestsRecordList.length > 0) {
                    //   parentTestsListGlobal.clear();
                    //   for (int i = 0; i < listViewTestsRecordList.length; i++) {
                    //     parentTestsListGlobal.add(listViewTestsRecordList[i]);
                    //   }
                    // }
                    print('(L90)${parentTestsListGlobal}');
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewTestStepsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewTestStepsRecord =
                            listViewTestStepsRecordList[listViewIndex];
                        return RunStepsItemWidget(
                          // key: Key(
                          //     'Keyu0g_${listViewIndex}_of_${listViewTestStepsRecordList.length}'),
                          index: listViewIndex.toDouble(),

                        descriptionParam: listViewTestStepsRecord.description,
                        passCriteraiParam: listViewTestStepsRecord.passCriteria,
                        screenshotParam: listViewTestStepsRecord.screenshot,
                        testStepItemRef: listViewTestStepsRecord.reference,



                        index: listViewIndex,
                          testNameParam: listViewTestStepsRecord.testName,
                          testsRefParam: listViewTestStepsRecord.reference,
                          dateCreatedParam: listViewTestStepsRecord.dateCreated!,
                          dateModifiedParam: listViewTestStepsRecord.dateModified!,
                        );
                      },
                    );
                  },
                ),
              ],
            )));
  }
}
