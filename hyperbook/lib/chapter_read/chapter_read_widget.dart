import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chapter_read_model.dart';
export 'chapter_read_model.dart';

class ChapterReadWidget extends StatefulWidget {
  const ChapterReadWidget({
    Key? key,
    this.chapter,
    this.title,
    this.body,
    this.hyperbookTitle,
    this.hyperbook,
    this.chapterState,
    this.chosenColors,
    this.chapterReaderIndex,
    this.readReference,
  }) : super(key: key);

  final DocumentReference? chapter;
  final String? title;
  final String? body;
  final String? hyperbookTitle;
  final DocumentReference? hyperbook;
  final int? chapterState;
  final List<Color>? chosenColors;
  final int? chapterReaderIndex;
  final DocumentReference? readReference;

  @override
  _ChapterReadWidgetState createState() => _ChapterReadWidgetState();
}

class _ChapterReadWidgetState extends State<ChapterReadWidget> {
  late ChapterReadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChapterReadModel());

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
        title: 'chapterRead',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: AutoSizeText(
                'Hyperbook: ${widget.hyperbookTitle}'.maybeHandleOverflow(
                  maxChars: 45,
                  replacement: '…',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primaryBtnText,
                  borderRadius: 30.0,
                  borderWidth: 2.0,
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
                Container(
                  width: 100.0,
                  height: 100.0,
                  constraints: BoxConstraints(
                    maxWidth: 20.0,
                  ),
                  decoration: BoxDecoration(),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.ButtonChangeChapterState(
                    width: 40.0,
                    height: 40.0,
                    newState: 0,
                    buttonLabel: 'Not visited',
                    buttonIcon: Icon(
                      FFIcons.keyeClosed,
                      size: 30.0,
                    ),
                    readReference: widget.readReference,
                    chapter: widget.chapter,
                    user: currentUserReference,
                    hyperbook: widget.hyperbook,
                    customIconString: ' ',
                    tooltipMessage: 'Not visited',
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.ButtonChangeChapterState(
                    width: 40.0,
                    height: 40.0,
                    newState: 1,
                    buttonLabel: 'Visited',
                    buttonIcon: Icon(
                      FFIcons.kprogressOne,
                      size: 30.0,
                    ),
                    hyperbook: widget.hyperbook,
                    readReference: widget.readReference,
                    chapter: widget.chapter,
                    user: currentUserReference,
                    customIconString: ' ',
                    tooltipMessage: 'VISITED',
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.ButtonChangeChapterState(
                    width: 40.0,
                    height: 40.0,
                    newState: 2,
                    buttonLabel: 'Partially read',
                    buttonIcon: Icon(
                      FFIcons.kprogressTwo,
                      size: 30.0,
                    ),
                    hyperbook: widget.hyperbook,
                    readReference: widget.readReference,
                    chapter: widget.chapter,
                    user: currentUserReference,
                    customIconString: ' ',
                    tooltipMessage: 'Partially read',
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.ButtonChangeChapterState(
                    width: 40.0,
                    height: 40.0,
                    newState: 3,
                    buttonLabel: 'Fully read',
                    buttonIcon: Icon(
                      FFIcons.kprogressFull,
                      size: 30.0,
                    ),
                    hyperbook: widget.hyperbook,
                    readReference: widget.readReference,
                    chapter: widget.chapter,
                    user: currentUserReference,
                    customIconString: ' ',
                    tooltipMessage: 'Fully read',
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.ButtonChangeChapterState(
                    width: 40.0,
                    height: 40.0,
                    newState: 4,
                    buttonLabel: 'Highlighted',
                    buttonIcon: Icon(
                      FFIcons.khighlighter,
                      size: 30.0,
                    ),
                    hyperbook: widget.hyperbook,
                    readReference: widget.readReference,
                    chapter: widget.chapter,
                    user: currentUserReference,
                    customIconString: '  ',
                    tooltipMessage: 'Highlighted',
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.ButtonChangeChapterState(
                    width: 40.0,
                    height: 40.0,
                    newState: 5,
                    buttonLabel: 'Depreciated',
                    buttonIcon: Icon(
                      FFIcons.kthumbsDown,
                      size: 30.0,
                    ),
                    hyperbook: widget.hyperbook,
                    readReference: widget.readReference,
                    chapter: widget.chapter,
                    user: currentUserReference,
                    customIconString: ' ',
                    tooltipMessage: 'Depreciated',
                  ),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.ButtonCreateChapterWithLinkTitle(
                    width: 40.0,
                    height: 40.0,
                    body: widget.body,
                    hyperbook: widget.hyperbook,
                    chapter: widget.chapter,
                    icon: Icon(
                      FFIcons.kdocNew,
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Chapter: ',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                          Text(
                            widget.title!,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          child: custom_widgets.DisplayChapterHtml(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            body: widget.body,
                            hyperbook: widget.hyperbook,
                            user: currentUserReference,
                          ),
                        ),
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
