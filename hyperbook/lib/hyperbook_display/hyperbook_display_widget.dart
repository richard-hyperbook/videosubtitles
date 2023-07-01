import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hyperbook_display_model.dart';
export 'hyperbook_display_model.dart';

class HyperbookDisplayWidget extends StatefulWidget {
  const HyperbookDisplayWidget({Key? key}) : super(key: key);

  @override
  _HyperbookDisplayWidgetState createState() => _HyperbookDisplayWidgetState();
}

class _HyperbookDisplayWidgetState extends State<HyperbookDisplayWidget> {
  late HyperbookDisplayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HyperbookDisplayModel());

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

    return Title(
        title: 'hyperbook_display',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              'Hyperbooks',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.95,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 20.0,
                        child: custom_widgets.Permissions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 20.0,
                          currentColorsIntsFromDatabase: (currentUserDocument
                                  ?.chapterColorsInts
                                  ?.toList() ??
                              []),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ' ',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Create new hyperbook?'),
                                          content: Text(' '),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  var hyperbooksRecordReference =
                                      HyperbooksRecord.collection.doc();
                                  await hyperbooksRecordReference
                                      .set(createHyperbooksRecordData(
                                    moderator: currentUserReference,
                                    title: 'Unknown',
                                    blurb: ' ',
                                    type: 1,
                                    requiresReaderApproval: 'No',
                                    visibility: 'Yes',
                                    requiresWriterApproval: 'Yes',
                                  ));
                                  _model.createdHyperbook =
                                      HyperbooksRecord.getDocumentFromData(
                                          createHyperbooksRecordData(
                                            moderator: currentUserReference,
                                            title: 'Unknown',
                                            blurb: ' ',
                                            type: 1,
                                            requiresReaderApproval: 'No',
                                            visibility: 'Yes',
                                            requiresWriterApproval: 'Yes',
                                          ),
                                          hyperbooksRecordReference);

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    isModerator: true,
                                  ));

                                  var chaptersRecordReference =
                                      ChaptersRecord.createDoc(
                                          _model.createdHyperbook!.reference);
                                  await chaptersRecordReference
                                      .set(createChaptersRecordData(
                                    title: 'Introduction',
                                    body: ' ',
                                    author: currentUserReference,
                                    xCoord: 50.0,
                                    yCoord: 50.0,
                                    chapterSymbol: '',
                                    awaitingApproval: false,
                                    isStartChapter: true,
                                  ));
                                  _model.createdIntroductionChapter =
                                      ChaptersRecord.getDocumentFromData(
                                          createChaptersRecordData(
                                            title: 'Introduction',
                                            body: ' ',
                                            author: currentUserReference,
                                            xCoord: 50.0,
                                            yCoord: 50.0,
                                            chapterSymbol: '',
                                            awaitingApproval: false,
                                            isStartChapter: true,
                                          ),
                                          chaptersRecordReference);

                                  await _model.createdHyperbook!.reference
                                      .update(createHyperbooksRecordData(
                                    startChapter: _model
                                        .createdIntroductionChapter!.reference,
                                  ));
                                }

                                setState(() {});
                              },
                              text: 'Create hyperbook',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            Text(
                              ' ',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Container(
                              width: 450.0,
                              height: 20.0,
                              child: custom_widgets.SelectModeratorForSearch(
                                width: 450.0,
                                height: 20.0,
                                user: currentUserReference,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!FFAppState().filterByModerator)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: StreamBuilder<List<HyperbooksRecord>>(
                          stream: queryHyperbooksRecord(
                            queryBuilder: (hyperbooksRecord) =>
                                hyperbooksRecord.orderBy('moderator'),
                            limit: 100,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitFadingCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<HyperbooksRecord>
                                listViewHyperbooksRecordList = snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewHyperbooksRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewHyperbooksRecord =
                                    listViewHyperbooksRecordList[listViewIndex];
                                return Material(
                                  color: Colors.transparent,
                                  elevation: 5.0,
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      border: Border.all(
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Title: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              listViewHyperbooksRecord.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Blurb: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              listViewHyperbooksRecord.blurb,
                                              maxLines: 4,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Moderator: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.7,
                                              height: 20.0,
                                              child: custom_widgets
                                                  .DisplayHyperbookModerator(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.7,
                                                height: 20.0,
                                                moderator:
                                                    listViewHyperbooksRecord
                                                        .moderator,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                FFIcons.kcog1,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .currentHyperbook =
                                                      listViewHyperbooksRecord
                                                          .reference;
                                                });

                                                context.pushNamed(
                                                  'hyperbook_edit',
                                                  queryParameters: {
                                                    'hyperbook': serializeParam(
                                                      listViewHyperbooksRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'hyperbookTitle':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .title,
                                                      ParamType.String,
                                                    ),
                                                    'hyperbookBlurb':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .blurb,
                                                      ParamType.String,
                                                    ),
                                                    'hyperbookType':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .type,
                                                      ParamType.int,
                                                    ),
                                                    'requresReaderApproval':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .requiresReaderApproval,
                                                      ParamType.String,
                                                    ),
                                                    'visibility':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .visibility,
                                                      ParamType.String,
                                                    ),
                                                    'startChapter':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .startChapter,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'collaboratorPriviledges':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .collabratorPriviledges,
                                                      ParamType.String,
                                                    ),
                                                    'requiresWriterApproval':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .requiresWriterApproval,
                                                      ParamType.String,
                                                    ),
                                                    'moderator': serializeParam(
                                                      listViewHyperbooksRecord
                                                          .moderator,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 0.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                FFIcons.kshare,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .currentHyperbook =
                                                      listViewHyperbooksRecord
                                                          .reference;
                                                });

                                                context.pushNamed(
                                                  'map_display',
                                                  queryParameters: {
                                                    'hyperbook': serializeParam(
                                                      listViewHyperbooksRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'hyperbookTitle':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .title,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 0.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                FFIcons.kclipboard,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .currentHyperbook =
                                                      listViewHyperbooksRecord
                                                          .reference;
                                                });

                                                context.pushNamed(
                                                  'chapter_display',
                                                  queryParameters: {
                                                    'hyperbook': serializeParam(
                                                      listViewHyperbooksRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'hyperbookTitle':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .title,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 0.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.delete,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Delete Hyperbook?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirm'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  await listViewHyperbooksRecord
                                                      .reference
                                                      .delete();
                                                }
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 0.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                FFIcons.kbookReader,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Request Read or Write Approval?'),
                                                              content: Text(
                                                                  'Request moderator to approve access'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Write'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Read'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Request Read Approval'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    await ConnectedUsersRecord
                                                            .createDoc(
                                                                listViewHyperbooksRecord
                                                                    .reference)
                                                        .set(
                                                            createConnectedUsersRecordData(
                                                      user:
                                                          currentUserReference,
                                                      status:
                                                          'Requesting Reader',
                                                      displayName:
                                                          currentUserDisplayName,
                                                    ));
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Read request for Hyperbook: ${listViewHyperbooksRecord.title}',
                                                      notificationText:
                                                          'from: ${currentUserDisplayName}',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        listViewHyperbooksRecord
                                                            .moderator!
                                                      ],
                                                      initialPageName:
                                                          'hyperbook_display',
                                                      parameterData: {},
                                                    );
                                                  }
                                                } else {
                                                  confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Requsest Write approval'),
                                                                content:
                                                                    Text('?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    await ConnectedUsersRecord
                                                            .createDoc(
                                                                listViewHyperbooksRecord
                                                                    .reference)
                                                        .set(
                                                            createConnectedUsersRecordData(
                                                      user:
                                                          currentUserReference,
                                                      status:
                                                          'Requesting Writer',
                                                      displayName:
                                                          currentUserDisplayName,
                                                    ));
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Write request for Hyperbook: ${listViewHyperbooksRecord.title}',
                                                      notificationText:
                                                          'from: ${currentUserDisplayName}',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        listViewHyperbooksRecord
                                                            .moderator!
                                                      ],
                                                      initialPageName:
                                                          'hyperbook_display',
                                                      parameterData: {},
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (FFAppState().filterByModerator)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: StreamBuilder<List<HyperbooksRecord>>(
                          stream: queryHyperbooksRecord(
                            queryBuilder: (hyperbooksRecord) =>
                                hyperbooksRecord.where('moderator',
                                    isEqualTo: FFAppState().chosenModerator),
                            limit: 100,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitFadingCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<HyperbooksRecord>
                                listViewHyperbooksRecordList = snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewHyperbooksRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewHyperbooksRecord =
                                    listViewHyperbooksRecordList[listViewIndex];
                                return Material(
                                  color: Colors.transparent,
                                  elevation: 5.0,
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      border: Border.all(
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Title: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              listViewHyperbooksRecord.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Blurb: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              listViewHyperbooksRecord.blurb,
                                              maxLines: 4,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Moderator: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Container(
                                              width: 200.0,
                                              height: 20.0,
                                              child: custom_widgets
                                                  .DisplayHyperbookModerator(
                                                width: 200.0,
                                                height: 20.0,
                                                moderator:
                                                    listViewHyperbooksRecord
                                                        .moderator,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.edit,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .currentHyperbook =
                                                      listViewHyperbooksRecord
                                                          .reference;
                                                });

                                                context.pushNamed(
                                                  'hyperbook_edit',
                                                  queryParameters: {
                                                    'hyperbook': serializeParam(
                                                      listViewHyperbooksRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'hyperbookTitle':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .title,
                                                      ParamType.String,
                                                    ),
                                                    'hyperbookBlurb':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .blurb,
                                                      ParamType.String,
                                                    ),
                                                    'hyperbookType':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .type,
                                                      ParamType.int,
                                                    ),
                                                    'requresReaderApproval':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .requiresReaderApproval,
                                                      ParamType.String,
                                                    ),
                                                    'requiresWriterApproval':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .requiresWriterApproval,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: FaIcon(
                                                FontAwesomeIcons.networkWired,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .currentHyperbook =
                                                      listViewHyperbooksRecord
                                                          .reference;
                                                });

                                                context.pushNamed(
                                                  'map_display',
                                                  queryParameters: {
                                                    'hyperbook': serializeParam(
                                                      listViewHyperbooksRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'hyperbookTitle':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .title,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.assignment,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .currentHyperbook =
                                                      listViewHyperbooksRecord
                                                          .reference;
                                                });

                                                context.pushNamed(
                                                  'chapter_display',
                                                  queryParameters: {
                                                    'hyperbook': serializeParam(
                                                      listViewHyperbooksRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'hyperbookTitle':
                                                        serializeParam(
                                                      listViewHyperbooksRecord
                                                          .title,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.delete,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Delete Hyperbook?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirm'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  await listViewHyperbooksRecord
                                                      .reference
                                                      .delete();
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
