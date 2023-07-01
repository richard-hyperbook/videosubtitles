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

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';

import '../../backend/firebase_storage/storage.dart';
// import '../../flutter_flow/upload_media.dart';
import 'package:flutter/foundation.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:html_editor_enhanced/utils/callbacks.dart';
import 'package:html_editor_enhanced/utils/file_upload_model.dart';
import 'package:html_editor_enhanced/utils/options.dart';
import 'package:html_editor_enhanced/utils/plugins.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import 'permissions.dart';
import 'dart:convert';
import '/chapter_edit/chapter_edit_model.dart';
export '/chapter_edit/chapter_edit_model.dart';

class HtmlEditorClass extends StatefulWidget {
  const HtmlEditorClass({
    Key? key,
    this.width,
    this.height,
    this.title,
    this.chapter,
    this.body,
    // this.hyperbook,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? title;
  final DocumentReference? chapter;
  final String? body;
  // final DocumentReference? hyperbook;

  @override
  _HtmlEditorClassState createState() => _HtmlEditorClassState();
}

class _HtmlEditorClassState extends State<HtmlEditorClass> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();
  String? dropDownValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ChaptersRecord? chapterToLinkTo;
  bool isMediaUploading = false;
  String uploadedFileUrl = '';
  late ChapterEditModel _model;

  String? output = 'XXX';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChapterEditModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  void getOutput() async {
    output = await controller.getText();
  }

  Widget insertImageButton() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor),
            //   FFButtonWidget(
            onPressed: () async {
              final selectedMedia = null;
              //  selectedMedia = await selectMediaWithSourceBottomSheet(
              // context: context,
              // allowPhoto: true,
              // );
              if (selectedMedia != null
                  //&&
                  // selectedMedia.every(
                  // (m) => validateFileFormat(m.storagePath, context))
                  ) {
                //  setState(() => isMediaUploading = true);
                var downloadUrls = <String>[];
                try {
                  // showUploadMessage(
                  // context,
                  // 'Uploading file...',
                  // showLoading: true,
                  // );
                  // downloadUrls = (await Future.wait(
                  // selectedMedia.map(
                  // (m) async => await uploadData(m.storagePath, m.bytes),
                  // ),
                  // ))
                  // .where((u) => u != null)
                  // .map((u) => u!)
                  // .toList();
                } finally {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  isMediaUploading = false;
                }
                if (downloadUrls.length == selectedMedia.length) {
                  setState(() => uploadedFileUrl = downloadUrls.first);
                  // showUploadMessage(context, 'Success!');
                } else {
                  setState(() {});
                  // showUploadMessage(context, 'Failed to upload media');
                  return;
                }
              }

              final usersUpdateData = createUsersRecordData(
                photoUrl: uploadedFileUrl,
              );
              //  await currentUserReference!.update(usersUpdateData);
              print('(D700)${uploadedFileUrl}');
              controller.insertNetworkImage(uploadedFileUrl, filename: 'IMAGE');
            },
            child: Text(
              'Insert Image',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  Widget textInputField(
      String label, String hint, TextEditingController controller) {
    print('(D20)${label}');
    return TextFormField(
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Overpass',
              color: Color(0xFF95A1AC),
            ),
        hintText: hint,
        hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Overpass',
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
            fontFamily: 'Overpass',
            color: Color(0xFF2B343A),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('(D1)');
    titleController.text = widget.title!;

    return GestureDetector(
        onTap: () {
          print('(D2)');
          if (!kIsWeb) {
            controller.clearFocus();
          }
        },
        child: Container(
            //   child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              SizedBox(height: 10),
              Container(
                height: 40,
                child: Row(children: [
                  Expanded(
                    flex: 8,
                    child: textInputField(
                        'Title', 'Chapter title...', titleController),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () async {
                        FFAppState().currentBody = await controller.getText();
                        FFAppState().currentChapterTitle = titleController.text;
                        final chaptersCreateData = createChaptersRecordData(
                          title: FFAppState().currentChapterTitle,
                          body: FFAppState().currentBody,
                        );
                        print('(D501-1)${FFAppState().currentChapter}');
                        // print('(D501)${widget.chapter}');
                        // DocumentReference c = widget.chapter!;
                        // String cs = c.path;
                        // DocumentReference h = widget.hyperbook!;
                        // String hs = h.path;
                        // String hcs = '/' + hs + '/' + cs;
                        // print('(D507)${widget.chapter!.path}£${widget.chapter!.id}*${widget.chapter!.parent}');
                        // print('(D508)${c}£${cs}*${h}@${hs}!${hcs}');
                        // DocumentReference hc = ChaptersRecord.(hcs);
                        // print('(D509)${hc}');
                        final chaptersUpdateData = createChaptersRecordData(
                          title: FFAppState().currentChapterTitle,
                          body: FFAppState().currentBody,
                        );
                        print('(D720)${chaptersUpdateData}');
                        await FFAppState()
                            .currentChapter!
                            .update(chaptersUpdateData);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Chapter saved',
                              // style:
                              // FlutterFlowTheme.of(context)
                              //     .bodyText1.override(
                              //   color: Colors.white,
                              // ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            // backgroundColor:
                            // FlutterFlowTheme.of(context)
                            //     .cerise,
                            // action: SnackBarAction(
                            //   label: 'OK',
                            //   textColor: Color(0x00000000),
                            //   onPressed: () async {
                            //     context.pop();
                            //   },
                            // ),
                          ),
                        );
                      },
                      child:
                          Text('Save', style: TextStyle(color: Colors.white)),
                    ),
                  )
                ]),
              ),
              // Expanded(  child:
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'Your text here...',
                  shouldEnsureVisible: true,
                  initialText: widget.body,
                  darkMode: false,
                  spellCheck: true,
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarPosition: ToolbarPosition.aboveEditor,
                  toolbarType: ToolbarType.nativeScrollable,
                  onButtonPressed:
                      (ButtonType type, bool? status, Function? updateStatus) {
                    return true;
                  },
                  onDropdownChanged: (DropdownType type, dynamic changed,
                      Function(dynamic)? updateSelectedItem) {
                    print(
                        "dropdown '${describeEnum(type)}' changed to $changed");
                    return true;
                  },
                  mediaLinkInsertInterceptor:
                      (String url, InsertFileType type) {
                    print('(D712)${url}');
                    return true;
                  },
                  // mediaUploadInterceptor:
                  //     (PlatformFile file, InsertFileType type) async {
                  //   print(file.name); //filename
                  //   print(file.size); //size in bytes
                  //   print(file.extension); //file extension (eg jpeg or mp4)
                  //   return true;
                  // },

                  mediaUploadInterceptor:
                      (PlatformFile file, InsertFileType type) async {
                    print('(D710)${file}&%${type}');
                    if (type == InsertFileType.image) {
                      String base64Data = base64.encode(file.bytes!);
                      String base64Image =
                          """<img src="data:image/${file.extension};base64,$base64Data" data-filename="${file.name}" width="50"/>""";
                      controller.insertHtml(base64Image);
                      print('(D711)${base64Image}');
                    }
                    return false;
                  },
                ),
                otherOptions: OtherOptions(
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
                callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                  print('html before change is $currentHtml');
                }, onChangeContent: (String? changed) {
                  print('content changed to $changed');
                }, onChangeCodeview: (String? changed) {
                  print('code changed to $changed');
                }, onChangeSelection: (EditorSettings settings) {
                  print('parent element is ${settings.parentElement}');
                  print('font name is ${settings.fontName}');
                }, onDialogShown: () {
                  print('dialog shown');
                }, onEnter: () {
                  print('enter/return pressed');
                }, onFocus: () {
                  print('editor focused');
                }, onBlur: () {
                  print('editor unfocused');
                }, onBlurCodeview: () {
                  print('codeview either focused or unfocused');
                }, onInit: () {
                  print('init');
                },
                    //this is commented because it overrides the default Summernote handlers
                    /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                    onImageUploadError: (FileUpload? file, String? base64Str,
                        UploadError error) {
                  print('(D713)${describeEnum(error)}');
                  print(base64Str ?? '');
                  if (file != null) {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                  }
                }, onKeyDown: (int? keyCode) {
                  print('$keyCode key downed');
                  print(
                      'current character count: ${controller.characterCount}');
                }, onKeyUp: (int? keyCode) {
                  print('$keyCode key released');
                }, onMouseDown: () {
                  print('mouse downed');
                }, onMouseUp: () {
                  print('mouse released');
                }, onNavigationRequestMobile: (String url) {
                  print(url);
                  return NavigationActionPolicy.ALLOW;
                }, onPaste: () {
                  print('pasted into editor');
                }, onScroll: () {
                  print('editor scrolled');
                }),
                plugins: [
                  SummernoteAtMention(
                      getSuggestionsMobile: (String value) {
                        var mentions = <String>['test1', 'test2', 'test3'];
                        return mentions
                            .where((element) => element.contains(value))
                            .toList();
                      },
                      mentionsWeb: ['test1', 'test2', 'test3'],
                      onSelect: (String value) {
                        print(value);
                      }),
                ],
              ),
              //        ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey),
                        onPressed: () {
                          controller.undo();
                        },
                        child:
                            Text('Undo', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey),
                        onPressed: () {
                          controller.clear();
                        },
                        child: Text('Reset',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryColor),
                        onPressed: () {
                          controller.redo();
                        },
                        child: Text(
                          'Redo',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryColor),
                        onPressed: () {
                          controller.disable();
                        },
                        child: Text('Disable',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryColor),
                        onPressed: () async {
                          controller.enable();
                        },
                        child: Text(
                          'Enable',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),

                      /*      TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: FlutterFlowTheme.of(context).primaryColor),
                onPressed: () {
                  controller.insertNetworkImage(
                      'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png',
                      filename: 'Google network image');
                },
                child: Text(
                  'Insert network image',
                  style: TextStyle(color: Colors.white),
                ),
              ), */

                      FFButtonWidget(
                        onPressed: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
                                controller
                                    .insertNetworkImage(downloadUrls.first);
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }
                        },
                        text: 'Insert photo<>',
                        options: FFButtonOptions(
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Rubik',
                                    color: Colors.white,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          flex: 5,
                          child: textInputField(
                              'Link caption',
                              'If blank, the chapter title will be used',
                              linkController)),
                      Expanded(
                        flex: 5,
                        child: DropdownButton<ChaptersRecord>(
                          value: chapterToLinkTo,
                          hint: Text('Please select chapter'),
                          items: chapterList!
                              .map<DropdownMenuItem<ChaptersRecord>>(
                                  (ChaptersRecord item) {
                            return DropdownMenuItem<ChaptersRecord>(
                              value: item,
                              child: Text(
                                item.title!,
                                // style: FlutterFlowTheme.bodyText1,
                              ),
                            );
                          }).toList(),
                          elevation: 2,
                          onChanged: (value) {
                            setState(() {
                              chapterToLinkTo = value!;
                            });

                            // widget.onChanged(value);
                          },
                          //icon: widget.icon,
                          isExpanded: true,
                          //dropdownColor: widget.fillColor,
                          focusColor: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryColor),
                          onPressed: () async {
                            //print(
                            //  '(D29-3)${chapterToLinkTo.ffRef!.path}+${chapterToLinkTo.title}');
                            String linkText = linkController.text;
                            if (linkController.text == '') {
                              linkText = chapterToLinkTo!.title!;
                            }
                            controller.insertHtml(before +
                                chapterToLinkTo!.reference!.path +
                                middle +
                                linkText +
                                after);
                          },
                          child: Text(
                            'Insert Link',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      insertImageButton(),
                    ],
                  ),
                ),
              ),
            ])
            //   )
            ));
  }
}
