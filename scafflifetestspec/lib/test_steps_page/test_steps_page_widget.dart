import '/backend/backend.dart';
import '/components/test_steps_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'test_steps_page_model.dart';
export 'test_steps_page_model.dart';

class TestStepsPageWidget extends StatefulWidget {
  const TestStepsPageWidget({super.key});

  @override
  State<TestStepsPageWidget> createState() => _TestStepsPageWidgetState();
}

class _TestStepsPageWidgetState extends State<TestStepsPageWidget> {
  late TestStepsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestStepsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryTestStepsCopy2 = await queryTestStepsRecordOnce(
        queryBuilder: (testStepsRecord) => testStepsRecord.where(
          'parentTest',
          isEqualTo: FFAppState().parentTestRefGlobal,
        ),
      );
      await actions.setNextTestStepIndex(
        _model.queryTestStepsCopy2!.toList(),
      );
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
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).alternate),
          automaticallyImplyLeading: true,
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Test Steps Page: ' + FFAppState().parentTestNameGlobal,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Test Steps',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        var testStepsRecordReference =
                            TestStepsRecord.collection.doc();
                        await testStepsRecordReference
                            .set(createTestStepsRecordData(
                          parentTest: FFAppState().parentTestRefGlobal,
                          index: FFAppState().nextTestStepIndex,
                          description: 'ddd',
                          screenshot: 'sss',
                          passCriteria: 'ppp',
                        ));
                        _model.newTestStep = TestStepsRecord.getDocumentFromData(
                            createTestStepsRecordData(
                              parentTest: FFAppState().parentTestRefGlobal,
                              index: FFAppState().nextTestStepIndex,
                              description: 'ddd',
                              screenshot: 'sss',
                              passCriteria: 'ppp',
                            ),
                            testStepsRecordReference);
                        FFAppState().nextTestStepIndex =
                            FFAppState().nextTestStepIndex + 7.0;
                        setState(() {});

                        context.pushNamed('TestStepsPage');

                        setState(() {});
                      },
                      text: 'Add Step',
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
            /*                  Text(
                      formatNumber(
                        FFAppState().nextTestStepIndex,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.automatic,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),*/
                   /* FFButtonWidget(
                      onPressed: () async {
                        _model.queryTestSteps = await queryTestStepsRecordOnce(
                          queryBuilder: (testStepsRecord) =>
                              testStepsRecord.where(
                            'parentTest',
                            isEqualTo: FFAppState().parentTestRefGlobal,
                          ),
                        );
                        _model.max = await actions.setNextTestStepIndex(
                          _model.queryTestSteps!.toList(),
                        );

                        setState(() {});
                      },
                      text: 'Next Index',
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
                    ),*/
                    FFButtonWidget(
                      onPressed: () async {
                       /* FFAppState().nextTestStepIndex =
                            FFAppState().nextTestStepIndex +;
                       */
                         for(int i = 0; i < _model
                            .listViewPagingController!.itemList!.length; i++){
                           final testStepItemRef = _model
                               .listViewPagingController!.itemList![i].reference;
                           await testStepItemRef!.update(createTestStepsRecordData(
                             // parentTest: widget.testParentRefParam,
                             index: (i + 1).toDouble(),
                             // description: _model.textController2.text,
                             // screenshot: '',
                             // passCriteria: _model.textController3.text,
                           ));

                         }

                        setState(() {});

                        context.goNamed('TestStepsPage');
                      },
                      text: 'Renumber',
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
                Container(
                  // height: 1000.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: const Color(0xFF801414),
                      width: 2.0,
                    ),
                  ),
                  child:
                      PagedListView<DocumentSnapshot<Object?>?, TestStepsRecord>(
                        // physics : ,
                        pagingController: _model.setListViewController(
                      TestStepsRecord.collection
                          .where(
                            'parentTest',
                            isEqualTo: FFAppState().parentTestRefGlobal,
                          )
                          .orderBy('index'),
                                        ),
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate: PagedChildBuilderDelegate<TestStepsRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewTestStepsRecord = _model
                            .listViewPagingController!.itemList![listViewIndex];
                        return wrapWithModel(
                          model: _model.testStepsItemModels.getModel(
                            random_data.randomString(
                              0,
                              10,
                              true,
                              false,
                              false,
                            ),
                            listViewIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: TestStepsItemWidget(
                            key: Key(
                              'Keygk0_${random_data.randomString(
                                0,
                                10,
                                true,
                                false,
                                false,
                              )}',
                            ),
                            index: listViewTestStepsRecord.index,
                            testParentNameParam:
                                FFAppState().parentTestRefGlobal!.id,
                            descriptionParam: listViewTestStepsRecord.description,
                            passCriteraiParam:
                                listViewTestStepsRecord.passCriteria,
                            screenshotParam: listViewTestStepsRecord.screenshot,
                            testStepItemRef: listViewTestStepsRecord.reference,
                            testParentRefParam: FFAppState().parentTestRefGlobal,
                          ),
                        );
                      },
                                        ),
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
