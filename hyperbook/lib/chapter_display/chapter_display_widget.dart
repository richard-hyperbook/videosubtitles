import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chapter_display_model.dart';
export 'chapter_display_model.dart';

class ChapterDisplayWidget extends StatefulWidget {
  const ChapterDisplayWidget({
    Key? key,
    this.hyperbook,
    this.hyperbookTitle,
  }) : super(key: key);

  final DocumentReference? hyperbook;
  final String? hyperbookTitle;

  @override
  _ChapterDisplayWidgetState createState() => _ChapterDisplayWidgetState();
}

class _ChapterDisplayWidgetState extends State<ChapterDisplayWidget> {
  late ChapterDisplayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChapterDisplayModel());

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
        title: 'chapter_display',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: true,
            title: Text(
              'Chapters of ${widget.hyperbookTitle}',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  FFIcons.kshare,
                  color: FlutterFlowTheme.of(context).cultured,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'map_display',
                    queryParameters: {
                      'hyperbook': serializeParam(
                        widget.hyperbook,
                        ParamType.DocumentReference,
                      ),
                      'hyperbookTitle': serializeParam(
                        widget.hyperbookTitle,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
              ),
            ],
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
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' ',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 0.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                FFIcons.kdocNew,
                                color: Color(0xD5000000),
                                size: 30.0,
                              ),
                              onPressed: () async {
                                await ChaptersRecord.createDoc(
                                        FFAppState().currentHyperbook!)
                                    .set(createChaptersRecordData(
                                  title: 'Unknown',
                                  body: '',
                                  author: currentUserReference,
                                  xCoord: random_data.randomDouble(10.0, 500.0),
                                  yCoord:
                                      random_data.randomDouble(10.0, 1000.0),
                                  chapterSymbol: ' ',
                                  awaitingApproval: false,
                                  isStartChapter: false,
                                ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<List<ChaptersRecord>>(
                      stream: queryChaptersRecord(
                        parent: FFAppState().currentHyperbook,
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
                        List<ChaptersRecord> listViewChaptersRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewChaptersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewChaptersRecord =
                                listViewChaptersRecordList[listViewIndex];
                            return Material(
                              color: Colors.transparent,
                              elevation: 5.0,
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 70.0,
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
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'chapterEdit',
                                      queryParameters: {
                                        'chapter': serializeParam(
                                          listViewChaptersRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'title': serializeParam(
                                          listViewChaptersRecord.title,
                                          ParamType.String,
                                        ),
                                        'body': serializeParam(
                                          listViewChaptersRecord.body,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Title: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            listViewChaptersRecord.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Author: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Container(
                                            width: 150.0,
                                            height: 20.0,
                                            child: custom_widgets
                                                .DisplayChapterAuthor(
                                              width: 150.0,
                                              height: 20.0,
                                              author: currentUserReference,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.0, -0.05),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                FFIcons.kedit1,
                                                color: Color(0xD5000000),
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState().currentChapter =
                                                      listViewChaptersRecord
                                                          .reference;
                                                });

                                                context.pushNamed(
                                                  'chapterEdit',
                                                  queryParameters: {
                                                    'chapter': serializeParam(
                                                      listViewChaptersRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'title': serializeParam(
                                                      listViewChaptersRecord
                                                          .title,
                                                      ParamType.String,
                                                    ),
                                                    'body': serializeParam(
                                                      listViewChaptersRecord
                                                          .body,
                                                      ParamType.String,
                                                    ),
                                                    'hyperbook': serializeParam(
                                                      widget.hyperbook,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'user': serializeParam(
                                                      currentUserReference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            child: custom_widgets
                                                .IconButtonChapterRead(
                                              width: 40.0,
                                              height: 40.0,
                                              hyperbookTitle:
                                                  widget.hyperbookTitle,
                                              chapterTitle:
                                                  listViewChaptersRecord.title,
                                              body: listViewChaptersRecord.body,
                                              hyperbook: widget.hyperbook,
                                              chapter: listViewChaptersRecord
                                                  .reference,
                                              user: currentUserReference,
                                            ),
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
                                                                'Delete chapter?'),
                                                            content: Text(' '),
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
                                                await listViewChaptersRecord
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
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
