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
import 'package:hyperbook/custom_code/widgets/get_chapters.dart';

import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'dart:math';
import '../../backend/backend.dart';
import '../../chapter_read/chapter_read_widget.dart';
import 'permissions.dart';

GlobalKey _keyScreen = GlobalKey();

class Link {
  Link({this.start, this.end});
  final int? start;
  final int? end;
}

List<Link> links = [
  // Link(start: 0, end: 1),
  // Link(start: 0, end: 2),
  // Link(start: 0, end: 3),
  // Link(start: 1, end: 2),
  // Link(start: 1, end: 3),
];

class DrawMap extends StatefulWidget {
  const DrawMap({
    Key? key,
    this.width,
    this.height,
    this.user,
    this.hyperbook,
    this.hyperbookTitle,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? user;
  final DocumentReference? hyperbook;
  final String? hyperbookTitle;

  @override
  _DrawMapState createState() => _DrawMapState();
}

// List<ChaptersRecord> chapterDocs = [];

List<ItemModel>? items;

class _DrawMapState extends State<DrawMap> {
  bool areChaptersLoaded = false;

  @override
  void initState() {
    super.initState();
    // setuptUserList(context);

    items = [
      // ItemModel(offset: Offset(70, 100), text: 'text1A'),
      //  ItemModel(offset: Offset(200, 100), text: 'text2A'),
      //   ItemModel(offset: Offset(200, 230), text: 'text3'),
    ];
    populateChapters();
    areChaptersLoaded = false;
  }

  Widget makeScreen() {
    return Scaffold(
      key: _keyScreen,
      body: Column(children: [
        ElevatedButton(
          child: Text('Save'),
          onPressed: () async {
            print('(D10-1)');
            for (int i = 0; i < items!.length; i++) {
              final chaptersUpdateData = createChaptersRecordData(
                xCoord: items![i].offset!.dx,
                yCoord: items![i].offset!.dy,
              );
              print(
                  '(D10-2)${i}@${items![i].text}%${items![i].chapter}?${chaptersUpdateData}');
              await items![i].chapter!.update(chaptersUpdateData);
            }
          },
        ),
        Expanded(
          child: Container(
            height: 500,
            width: 1000,
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  size: Size(double.infinity, double.infinity),
                  painter: CurvedPainter(
                      //       links: links,//links.map((item) => item.offset!).toList(),
                      ),
                ),
                ..._buildItems()
              ],
            ),
          ),
        )
      ]),
    );
  }

  void populateChapters(
      //   DocumentReference? parent
      ) {
    // List<ChaptersRecord> chapterList =
    //     await queryChaptersRecordOnce(parent: parent);
    // List<ReadReferencesRecord> readReferenceList =
    //     await queryReadReferencesRecordOnce(parent: widget.user);

    print('(C87-0)${chapterList}');
    print('(C87-1)${readReferenceList}');
    areChaptersLoaded = true;
    for (int i = 0; i < chapterList.length; i++) {
      var chapter = chapterList[i];

      final List<Color> defaultColors = [
        Colors.black,
        Colors.lime,
        Colors.red,
        Colors.blue,
        Colors.amber,
        Colors.grey,
      ];

      double x = chapterList[i].xCoord!;
      double y = chapterList[i].yCoord!;
      String title = chapterList[i].title!;
      DocumentReference<Object?> chapterRef = chapterList[i].reference;
      String body = chapterList[i].body!;
      Color color = Colors.grey;
      bool isStartChapter = chapterList[i].isStartChapter!;
      String chapterSymbol = ' ';
      if (chapterList[i].chapterSymbol != null) {
        chapterSymbol = chapterList[i].chapterSymbol!;
      }
      int state = 0;
      DocumentReference? readReference;
      for (int j = 0; j < readReferenceList.length; j++) {
        // print('(D69-0)${readReferenceList[j].chapter}*${chapter.ffRef}');
        if (readReferenceList[j].chapter == chapter.reference) {
          readReference = readReferenceList[j].reference;
          state = readReferenceList[j].readStateIndex!;
          color = FFAppState().chosenColors[state];
          print('(D69-1)${state}*${j}£${color}');
          break;
        }
      }
      print(
          '(C87-2)${FFAppState().chosenColors}\${x}|${y};${chapter}%${title}*${chapter}>${body}');
      items!.add(ItemModel(
        offset: Offset(x, y),
        text: title,
        chapter: chapterRef,
        body: body,
        color: color,
        chapterState: state,
        readReference: readReference,
        borderRadius: (isStartChapter) ? 20 : 0,
        chapterSymbol: chapterSymbol,
      ));
    }
    print('(D43-1)${links.length}');
    links.clear();
    for (int i = 0; i < chapterList.length; i++) {
      //print('(D43-0)${i}£${chapterList[i].ffRef!.path}');
      int stringPos = 0;
      String body = chapterList[i].body!;
      int subStartPos = 0;
      int subEndPos = 0;
      while (stringPos != -1) {
        String targetRef = '';
        subStartPos = body.indexOf('hyperbooks/', stringPos);
        if (subStartPos != -1) {
          subEndPos = body.indexOf('"', subStartPos);
          if (subEndPos != -1) {
            targetRef = body.substring(subStartPos, subEndPos);
            for (int j = 0; j < chapterList.length; j++) {
              //      print(
              //        '(D43-1)${i}%${j}£${chapterList[j].ffRef!.path}&&&${targetRef}');
              if (chapterList[j].reference!.path == targetRef) {
                links.add(Link(start: i, end: j));
                print('(D43-2)${links.length}');
                break;
              }
            }
            print('(D43-3)${subEndPos}');
            subStartPos = subEndPos;
          }
          print('(D43-)${subEndPos}');
          if (subEndPos > 0) {
            stringPos = subEndPos;
          } else {
            stringPos = -1;
          }
          print('(D43-5)${subEndPos}');
        } else {
          stringPos = -1;
        }
        print('(D43-6)${subEndPos}');
      }
      print('(D43-7)${subEndPos}');
    }
    print('(D43-8)${links.length}');

    return;
  }

  Function onDragStart(int index) => (double x, double y) {
        print('(D23-1)${x}*${y}?${Offset(x, y)}');
        setState(() {
          items![index] = items![index].copyWithNewOffset(Offset(x, y));
        });
      };

  @override
  Widget build(BuildContext context) {
    return makeScreen();
  }

  List<Widget> _buildItems() {
    final res = <Widget>[];
    print('(D21)${items!.length}');
    items!.asMap().forEach((ind, item) {
      print('(D26)${item.text}+${item.chapter}#${item.offset}@');
      res.add(_Item(
        onDragStart: onDragStart(ind),
        offset: item.offset,
        text: item.text,
        chapter: item.chapter,
        body: item.body,
        color: item.color,
        hyperbook: widget.hyperbook,
        chapterState: item.chapterState,
        readReference: item.readReference,
        borderRadius: item.borderRadius,
        chapterSymbol: item.chapterSymbol,
      ));
    });
    print('(D22)${res}%${items}');
    return res;
  }
}

class _Item extends StatelessWidget {
  _Item({
    Key? key,
    this.offset,
    this.onDragStart,
    this.text,
    this.chapter,
    this.body,
    this.color,
    this.hyperbook,
    this.chapterState,
    this.readReference,
    this.borderRadius,
    this.chapterSymbol,
  });

  final double? size = 40;
  final Offset? offset;
  final Function? onDragStart;
  final String? text;
  final DocumentReference<Object?>? chapter;
  final String? body;
  final Color? color;
  final DocumentReference? hyperbook;
  final int? chapterState;
  final DocumentReference? readReference;
  final double? borderRadius;
  final String? chapterSymbol;

  _handleDrag(details) {
    // final positionScreen = _keyScreen.currentContext!.findRenderObject()!.localToGlobal(Offset.zero);

    print('(D23)${details}£${details.globalPosition}');
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy - 100;
    onDragStart!(x, y);
  }

  @override
  Widget build(BuildContext context) {
    print('(D27)${offset!.dx}^${offset!.dy}&${text}');
    return Positioned(
      left: offset!.dx - size! / 2,
      top: offset!.dy - size! / 2,
      child: GestureDetector(
          onPanStart: _handleDrag,
          onPanUpdate: _handleDrag,
          onDoubleTap: () async {
            print('(D24)${this.body}%${this.chapter}*${this.text}+');
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChapterReadWidget(
                    chapter: this.chapter,
                    title: this.text,
                    body: this.body,
                    hyperbook: this.hyperbook,
                    chapterState: this.chapterState,
                    readReference: this.readReference,
                    chosenColors: FFAppState().chosenColors.toList(),
                  ),
                ));
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size,
                  height: size,
                  child: Text(
                    chapterSymbol!,
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    color: color!,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: (BorderRadius.circular(borderRadius!)),
                  ),
                ),
                Text(text!),
              ])),
    );
  }
}

class CurvedPainter extends CustomPainter {
  // CurvedPainter({this.offsets});
  // final List<Offset>? offsets;
//  CurvedPainter({));
  // final List<Link>? links;

  @override
  void paint(Canvas canvas, Size size) {
    print('(XH14)${links}%');
    if (links.length > 0) {
      links.asMap().forEach((index, link) {
        // if (index == 0) return;
        var o2 = items![links[index].start!].offset!;
        var o1 = items![links[index].end!].offset!;
        print('(D42)${o1}*${o2}&${index}?${link}');
        canvas.drawLine(
          o1,
          o2,
          Paint()
            ..color = Colors.black
            ..strokeWidth = 2,
        );
        final x1 = o1.dx;
        final y1 = o1.dy;
        final x2 = o2.dx;
        final y2 = o2.dy;
        var xDiff = x2 - x1;
        var yDiff = y2 - y1;
        var angle = atan2(yDiff, xDiff);
        var transx = (x1 + x2) * 0.5;
        var transy = (y1 + y2) * 0.5;
        canvas.translate(transx, transy);
        canvas.rotate(angle);
        Paint paint = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4.0;
        canvas.drawLine(Offset(0.0, 0.0), Offset(10.0, 5.0), paint);
        canvas.drawLine(Offset(0.0, 0.0), Offset(10.0, -5.0), paint);
        canvas.rotate(-angle);
        canvas.translate(-transx, -transy);
      });
    }
  }

  @override
  bool shouldRepaint(CurvedPainter oldDelegate) => true;
}

class ItemModel {
  ItemModel(
      {this.offset,
      this.text,
      this.chapter,
      this.body,
      this.color,
      this.chapterState,
      this.readReference,
      this.borderRadius,
      this.chapterSymbol});

  final Offset? offset;
  final String? text;
  final DocumentReference<Object?>? chapter;
  final String? body;
  final Color? color;
  final int? chapterState;
  final DocumentReference? readReference;
  final double? borderRadius;
  final String? chapterSymbol;

  ItemModel copyWithNewOffset(Offset offset) {
    return ItemModel(
        offset: offset,
        text: text,
        chapter: chapter,
        body: body,
        color: color,
        chapterState: chapterState,
        readReference: readReference,
        borderRadius: borderRadius,
        chapterSymbol: chapterSymbol);
  }
}
