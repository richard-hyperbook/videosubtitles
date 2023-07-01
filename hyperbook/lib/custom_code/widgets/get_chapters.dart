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

import 'index.dart'; // Imports other custom widgets
import 'permissions.dart';

// List<ChaptersRecord> chapterList1 = [];
// List<ReadReferencesRecord> readReferenceList1 = [];

class GetChapters extends StatefulWidget {
  const GetChapters({
    Key? key,
    this.width,
    this.height,
    this.hyperbook,
    this.user,
    this.drawMapWhenComplete,
    this.hyperbookTitle,
    this.editHtmlWhenComplete,
    this.body,
    this.chapter,
    this.chapterTitle,
    this.isIntroductionMap,
    // this.approvedHyperbookReads,
    // this.approvedHyperbookCollaborates,
    this.moderator,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? hyperbook;
  final DocumentReference? user;
  final bool? drawMapWhenComplete;
  final String? hyperbookTitle;
  final bool? editHtmlWhenComplete;
  final String? body;
  final DocumentReference? chapter;
  final String? chapterTitle;
  final bool? isIntroductionMap;
  // final List<DocumentReference>? approvedHyperbookReads;
  // final List<DocumentReference>? approvedHyperbookCollaborates;
  final DocumentReference? moderator;

  @override
  _GetChaptersState createState() => _GetChaptersState();
}

Future<List<ChaptersRecord>> populateChaptersAndReadReferences(
    DocumentReference? hyperbook, DocumentReference? user) async {
  currentHyperbook = await HyperbooksRecord.getDocumentOnce(hyperbook!);
  chapterList.clear();
  print('(D210-1)${hyperbook}%${FFAppState().introductionHyperbook}');
  chapterList = await queryChaptersRecordOnce(parent: hyperbook);
  readReferenceList.clear();
  readReferenceList = await queryReadReferencesRecordOnce(parent: user);
  connectedUsersList.clear();
  readReferenceList = await queryReadReferencesRecordOnce(parent: user);
  connectedUsersList.clear();
  connectedUsersList = await queryConnectedUsersRecordOnce(parent: hyperbook);

  print('(C87A-0)${chapterList}');
  print('(C87A-1)${readReferenceList}');
  return chapterList!;
}
/*
const kVH0 = 'No';
const kVH1 = 'Yes';
const kRRA0 = 'No readers';
const kRRA1 = 'Yes';
const kRRA2 = 'No';
const kCRA0 = 'No collaborators';
const kCRA1 = 'Each chapter';
const kCRA2 = 'Yes';
const kCRA3 = 'No';
*/

class _GetChaptersState extends State<GetChapters> {
  @override
  Widget build(BuildContext context) {
    print(
        '(D200)${widget.hyperbook}%${widget.drawMapWhenComplete}+${widget.editHtmlWhenComplete}');
    print('(D200-2)%${widget.hyperbook}&${currentHyperbook}+${kRWA1}@');
    print('(D502-1)${widget.chapter}');
    return FutureBuilder<void>(
        future:
            populateChaptersAndReadReferences(widget.hyperbook, widget.user),
        builder: (BuildContext context, snapshot) {
          bool approvedToRead = false;
          print('(D876-0)${connectedUsersList}^${connectedUsersList.length}');
          if (connectedUsersList.length > 0) {
            for (int i = 0; i < connectedUsersList.length; i++) {
              print('(D876-0A)${connectedUsersList}^${i}');
              if (connectedUsersList[i].user == widget.user) {
                if ((connectedUsersList[i].status == kReader) ||
                    (connectedUsersList[i].status == kWriter)) {
                  approvedToRead = true;
                  break;
                }
              }
            }
          }
          print('(D876-1)${currentHyperbook}^${widget}*${widget.user}');
          bool okToRead = true;
          if ((currentHyperbook != null) &&
              (currentHyperbook!.requiresReaderApproval != null) &&
              (widget.moderator != null) &&
              (widget.user != null)) {
            print('(D876-1A)${currentHyperbook}^${widget}*${widget.user}');
            okToRead = ((approvedToRead &&
                        (currentHyperbook!.requiresReaderApproval == kRRA1) ||
                    (currentHyperbook!.requiresReaderApproval == kRRA2)) ||
                (widget.user == widget.moderator));
          }
          bool approvedToWrite = true;
          // if (true /*widget.approvedHyperbookReads != null*/) {
          //   approvedToCollaborate = widget.approvedHyperbookCollaborates!
          //       .contains(widget.hyperbook);
          // }
          print('(D876-2)${currentHyperbook}^${widget}*${widget.user}');
          bool okToWrite = true;
          if ((currentHyperbook != null) &&
              (currentHyperbook!.requiresWriterApproval != null) &&
              (widget.moderator != null) &&
              (widget.user != null)) {
            print('(D876-2A)${currentHyperbook}^${widget}*${widget.user}');
            okToWrite = (((approvedToWrite) &&
                        (currentHyperbook!.requiresWriterApproval == kRWA1) ||
                    (currentHyperbook!.requiresWriterApproval == kRWA2)) ||
                (widget.user == widget.moderator));
          }
          print('(D876-3)${currentHyperbook}^${widget}*${widget.user}');
          if (snapshot.hasData) {
            areChaptersLoaded = true;
            if (widget.drawMapWhenComplete!) {
              if (okToRead) {
                print('(D200-1)${widget.hyperbook}');
                return DrawMap(
                  width: MediaQuery.of(context).size.width,
                  height: widget.height,
                  user: widget.user,
                  hyperbook: widget.hyperbook,
                  hyperbookTitle: widget.hyperbookTitle,
                  isIntroductionMap: widget.isIntroductionMap,
                );
              } else {
                return Center(child: Text('Access denied'));
              }
            }
            print('(D502-2)${widget.chapter}');
            if (widget.editHtmlWhenComplete!) {
              if (okToWrite) {
                return HtmlEditorClass(
                  title: widget.chapterTitle,
                  chapter: widget.chapter,
                  body: widget.body,
                  //     hyperbook: widget.hyperbook,
                );
              }
              print('(D502-3)${widget.hyperbook}@${widget.hyperbookTitle}');
            } else {
              return Center(child: Text('Access denied'));
            }
            // Backup hyperbook
            return BackupHyperbookClass(
                hyperbook: widget.hyperbook,
                hyperbookTitle: widget.hyperbookTitle);
          } else {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          }
        });
  }
}
