// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../custom_code/widgets/index.dart' as custom_widgets;
import '../../flutter_flow/random_data_util.dart' as random_data;
import '../../chapter_edit/chapter_edit_widget.dart';
//import '../../auth/auth_util.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import 'permissions.dart';
import '../../flutter_flow/custom_icons.dart';

class ButtonCreateChapterWithLinkTitle extends StatefulWidget {
  const ButtonCreateChapterWithLinkTitle({
    Key? key,
    this.width,
    this.height,
    this.hyperbook,
    this.chapter,
    this.body,
    this.icon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? hyperbook;
  final DocumentReference? chapter;
  final String? body;
  final Widget? icon;

  @override
  _ButtonCreateChapterWithLinkTitleState createState() =>
      _ButtonCreateChapterWithLinkTitleState();
}

class _ButtonCreateChapterWithLinkTitleState
    extends State<ButtonCreateChapterWithLinkTitle> {
  TextEditingController? titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
  }

  Future addLinkFromChapter(
    DocumentReference? sourceChapter,
    String? sourceChapterBody,
    DocumentReference? targetChapter,
    DocumentReference? hyperbook,
    String? title,
  ) async {
    //const String before = '<br><a href="#';
    //const String after = '" target="_blank">LINK</a>';
    //<br><a href="#hyperbooks/CT3ZqDTUNj0xgTWmTqWL/chapters/K5bXnfKhWPa9s1FddmFE" target="_blank">TITLE</a>
    final String h = targetChapter!.path;
    final String hyperlink = before + h + middle + title! + after;
    final String newBody = sourceChapterBody! + hyperlink;
    final chaptersUpdateData = createChaptersRecordData(
      body: newBody,
    );
    await sourceChapter!.update(chaptersUpdateData);
  }

  Widget titleEntry() {
    return TextFormField(
      controller: titleController,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Title of new Chapter',
        labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Rubik',
              color: Color(0xFF95A1AC),
            ),
        hintText: 'Enter your title here...',
        hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Rubik',
              color: Color(0xFF95A1AC),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFDBE2E7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFDBE2E7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).white,
        contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
      ),
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Rubik',
            color: Color(0xFF2B343A),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: Colors.white, //FlutterFlowTheme.of(context).cultured,
      borderRadius: 30,
      borderWidth: 1,
      buttonSize: 60,
      icon: widget.icon!,
      onPressed: () async {
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Create new chapter?'),
                  content: titleEntry(),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, false),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final chaptersCreateData = createChaptersRecordData(
                          title: titleController!.text,
                          body: '',
                          author: null, //currentUserReference,
                          xCoord: random_data.randomDouble(20, 400),
                          yCoord: random_data.randomDouble(20, 500),
                          chapterSymbol: ' ',
                          awaitingApproval: false,
                        );
                        print('(D380-1)');
                        var chaptersRecordReference =
                            ChaptersRecord.createDoc(widget.hyperbook!);
                        print('(D380-2)${widget.hyperbook}');
                        await chaptersRecordReference.set(chaptersCreateData);
                        var chapterJustCreated =
                            ChaptersRecord.getDocumentFromData(
                                chaptersCreateData, chaptersRecordReference);
                        print('(D381)${chapterJustCreated}');

                        setState(() => FFAppState().currentChapter =
                            chapterJustCreated!.reference);
                        await addLinkFromChapter(
                          widget.chapter,
                          widget.body,
                          chapterJustCreated!.reference,
                          widget.hyperbook,
                          titleController!.text,
                        );
                        print('(D382)');

                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: ChapterEditWidget(
                              chapter: chapterJustCreated!.reference,
                              title: titleController!.text,
                              body: ' ',
                              hyperbook: widget.hyperbook,
                              user: null, //currentUserReference,
                            ),
                          ),
                        );

                        Navigator.pop(alertDialogContext, true);
                      },
                      child: Text('Confirm'),
                    ),
                  ],
                );
              },
            ) ??
            false;

        setState(() {});
      },
    );
  }
}
