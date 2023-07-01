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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets
import 'index.dart'; // Imports other custom widgets
import 'index.dart'; // Imports other custom widgets
import 'index.dart'; // Imports other custom widgets
import 'index.dart'; // Imports other custom widgets
import '../../app_state.dart';

class Permissions extends StatefulWidget {
  const Permissions({
    Key? key,
    this.width,
    this.height,
    this.currentColorsIntsFromDatabase,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<int>? currentColorsIntsFromDatabase;

  @override
  _PermissionsState createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  Widget build(BuildContext context) {
/*
    if ((FFAppState().chosenColors == null) ||
        (FFAppState().chosenColors.length != kColorStatusLength)) {
      if ((widget.currentColorsIntsFromDatabase! == null) ||
          (widget.currentColorsIntsFromDatabase!.length !=
              kColorStatusLength)) {
        FFAppState().chosenColors = List.from(kDefaultColors);
      } else {
        FFAppState().chosenColors =
            List.from(widget.currentColorsIntsFromDatabase!);
      }
    }
    */
    print(
        '(D60-1)${FFAppState().chosenColors}*${widget.currentColorsIntsFromDatabase!}');

    FFAppState().chosenColors.clear();
    for (int i = 0; i < widget.currentColorsIntsFromDatabase!.length; i++) {
      FFAppState()
          .chosenColors
          .add(Color(widget.currentColorsIntsFromDatabase![i]));
    }
    print(
        '(D60-2)${FFAppState().chosenColors}*${widget.currentColorsIntsFromDatabase!}');

    return Container();
  }
}

/*
Moderator Display Names are unique
Hyperbooks asre identified by Title and Moderator Display Name
Hyperbook types:
1= Everyone cam create chapters, everyonone can edit and delete
2= Contributors can create chapters, any contributor can edit and delete
3= Contributors can create chapters, creating contributor can edit and delete
4= Contributors can create chapters but not edit oonce posted but can delete
5= Contributors can create chapters but not edit or delete oonce posted
6..10= as 1..5 no avialblity to non-members
Visibility of Hyperbooks (title + Moderator Disply Name) as ability to read chapters

Type	E			R 		C 		O			M 		A
01*		CRUD	CRUD	CRUD	RUD		CRUD	CRUD
02*		R			R			CRUD	RUD		CRUD	CRUD
03*		R			R			CR		RUD		CRUD	CRUD
04*		R			R			CR		RD		CRUD	CRUD
05*		R			R			CR		R			CRUD	CRUD
06*					R			CRUD	RUD		CRUD	CRUD
07*		 			R			CRUD	RUD		CRUD	CRUD
08*					R			CR		RUD		CRUD	CRUD
09*					R			CR		RD		CRUD	CRUD
10*					R			CR		R			CRUD	CRUD

A= Anyone can sign on as a Reader or Contributor from Moderator Display Name and Title
B= Anyone can sign on as a Reader from Moderator Display Name and Title, Contributors must be approved by Moderator



*/

const String kEveryone = 'Everyone';
const String kReader = 'Reader';
const String kRequestingReader = 'Requesting Reader';
const String kRequestingWriter = 'Requesting Writer';
const String kWriter = 'Writer';
const String kOriginator = 'Originator';
const String kModerator = 'Moderator';
const String kAdministrator = 'Administrator';
const List<String> kRoles = [
  kEveryone,
  kReader,
  kWriter,
  kOriginator,
  kModerator,
  kAdministrator
];

const String kCreate = 'Create';
const String kRead = 'Read';
const String kUpdate = 'update';
const String kDelete = 'Delete';
const List<String> kActions = [kCreate, kRead, kUpdate, kDelete];

const String kPublic = 'Public';
const String kPrivate = 'Private';
const List<String> kVaialabilities = [kPublic, kPrivate];

const int kNotVisitedIndex = 0;
const int kVisitedIndex = 1;
const int kPartiallyReadIndex = 2;
const int kFullyReadIndex = 3;
const int kHighlightedIndex = 4;
const int kDepredciatedIndex = 5;
const String kNotVisitedString = 'Not visited';
const String kVisitedString = 'Visited';
const String kPartiallyReadString = 'Partially read';
const String kFullyReadString = 'Fully Read';
const String kHighlightedString = 'Highlighted';
const String kDepredciatedString = 'Depreciated';
const String kAwaitingApprovalString = 'Awaiting approval';

const List<String> kChapterStateList = [
  kNotVisitedString,
  kVisitedString,
  kPartiallyReadString,
  kFullyReadString,
  kHighlightedString,
  kDepredciatedString,
  kAwaitingApprovalString,
];
const List<Color> kDefaultColors = [
  Colors.black,
  Colors.lime,
  Colors.blueGrey,
  Colors.blue,
  Colors.amber,
  Colors.grey,
  Colors.red,
];
const int kColorStatusLength = 7;
bool areChaptersLoaded = false;

const kRRA0 = 'No readers';
const kRRA1 = 'Yes';
const kRRA2 = 'No';
const kRWA0 = 'No writers';
const kRWA1 = 'Yes';
const kRWA2 = 'No';

List<HyperbooksRecord> hyperbookList = [];
HyperbooksRecord? currentHyperbook;
List<ChaptersRecord> chapterList = [];
List<ReadReferencesRecord> readReferenceList = [];
bool filterByModerator = false;
const String before = ' <a href="#';
const String middle =
    '" target="_blank"style="background-color:black;color:white;padding:2px;border:2px solid grey;border-radius:5px">';
const String after = '</a> ';
Map<DocumentReference, int> introductionReadStateIndex = {};
List<ConnectedUsersRecord> connectedUsersList = [];
