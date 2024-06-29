import '/backend/backend.dart';
import '/components/tests_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'tests_page_model.dart';
export 'tests_page_model.dart';

class TestsPageWidget extends StatefulWidget {
  const TestsPageWidget({super.key});

  @override
  State<TestsPageWidget> createState() => _TestsPageWidgetState();
}

class _TestsPageWidgetState extends State<TestsPageWidget> {
  late TestsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.query1 = await queryTestsRecordOnce(
        queryBuilder: (testsRecord) => testsRecord.where(
          'testName',
          isEqualTo: 'Application Test',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().parentTestRefGlobal = _model.query1?.reference;
      FFAppState().parentTestNameGlobal = _model.query1!.testName;
      setState(() {});
    });

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
            'Tests Page',
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
                    'Tests',
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
                    text: 'Add Test',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
              StreamBuilder<List<TestsRecord>>(
                stream: queryTestsRecord(
                  queryBuilder: (testsRecord) =>
                      testsRecord.orderBy('testName'),
                  limit: 10,
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
                  List<TestsRecord> listViewTestsRecordList = snapshot.data!;
                  if (listViewTestsRecordList.length > 0) {
                    parentTestsListGlobal.clear();
                    for (int i = 0; i < listViewTestsRecordList.length; i++) {
                      parentTestsListGlobal.add(listViewTestsRecordList[i]);
                    }
                  }
                  print('(L80A)${listViewTestsRecordList.length}&${listViewTestsRecordList}');
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewTestsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      print('(L80B)${listViewIndex}');
                      final listViewTestsRecord =
                          listViewTestsRecordList[listViewIndex];
                      print('(L80C)${listViewTestsRecord}');
                      return TestsItemWidget(
                        key: Key(
                            'Keyu0g_${listViewIndex}_of_${listViewTestsRecordList.length}'),
                        index: listViewIndex,
                        testNameParam: listViewTestsRecord.testName,
                        testsRefParam: listViewTestsRecord.reference,
                        dateCreatedParam: listViewTestsRecord.dateCreated!,
                        dateModifiedParam: listViewTestsRecord.dateModified!,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
