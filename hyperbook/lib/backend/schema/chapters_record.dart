import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChaptersRecord extends FirestoreRecord {
  ChaptersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "xCoord" field.
  double? _xCoord;
  double get xCoord => _xCoord ?? 0.0;
  bool hasXCoord() => _xCoord != null;

  // "yCoord" field.
  double? _yCoord;
  double get yCoord => _yCoord ?? 0.0;
  bool hasYCoord() => _yCoord != null;

  // "chapterSymbol" field.
  String? _chapterSymbol;
  String get chapterSymbol => _chapterSymbol ?? '';
  bool hasChapterSymbol() => _chapterSymbol != null;

  // "awaitingApproval" field.
  bool? _awaitingApproval;
  bool get awaitingApproval => _awaitingApproval ?? false;
  bool hasAwaitingApproval() => _awaitingApproval != null;

  // "isStartChapter" field.
  bool? _isStartChapter;
  bool get isStartChapter => _isStartChapter ?? false;
  bool hasIsStartChapter() => _isStartChapter != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _xCoord = castToType<double>(snapshotData['xCoord']);
    _yCoord = castToType<double>(snapshotData['yCoord']);
    _chapterSymbol = snapshotData['chapterSymbol'] as String?;
    _awaitingApproval = snapshotData['awaitingApproval'] as bool?;
    _isStartChapter = snapshotData['isStartChapter'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chapters')
          : FirebaseFirestore.instance.collectionGroup('chapters');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chapters').doc();

  static Stream<ChaptersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChaptersRecord.fromSnapshot(s));

  static Future<ChaptersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChaptersRecord.fromSnapshot(s));

  static ChaptersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChaptersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChaptersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChaptersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChaptersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChaptersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChaptersRecordData({
  String? title,
  String? body,
  DocumentReference? author,
  double? xCoord,
  double? yCoord,
  String? chapterSymbol,
  bool? awaitingApproval,
  bool? isStartChapter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'body': body,
      'author': author,
      'xCoord': xCoord,
      'yCoord': yCoord,
      'chapterSymbol': chapterSymbol,
      'awaitingApproval': awaitingApproval,
      'isStartChapter': isStartChapter,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChaptersRecordDocumentEquality implements Equality<ChaptersRecord> {
  const ChaptersRecordDocumentEquality();

  @override
  bool equals(ChaptersRecord? e1, ChaptersRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.body == e2?.body &&
        e1?.author == e2?.author &&
        e1?.xCoord == e2?.xCoord &&
        e1?.yCoord == e2?.yCoord &&
        e1?.chapterSymbol == e2?.chapterSymbol &&
        e1?.awaitingApproval == e2?.awaitingApproval &&
        e1?.isStartChapter == e2?.isStartChapter;
  }

  @override
  int hash(ChaptersRecord? e) => const ListEquality().hash([
        e?.title,
        e?.body,
        e?.author,
        e?.xCoord,
        e?.yCoord,
        e?.chapterSymbol,
        e?.awaitingApproval,
        e?.isStartChapter
      ]);

  @override
  bool isValidKey(Object? o) => o is ChaptersRecord;
}
