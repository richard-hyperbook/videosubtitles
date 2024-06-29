import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RunsRecord extends FirestoreRecord {
  RunsRecord._(
      super.reference,
      super.data,
      ) {
    _initializeFields();
  }

  // "parentTest" field.
  DocumentReference? _parentTest;
  DocumentReference? get parentTest => _parentTest;
  bool hasParentTest() => _parentTest != null;

  // "dateRun" field.
  DateTime? _dateRun;
  DateTime? get dateRun => _dateRun;
  bool hasDateRun() => _dateRun != null;

  // "passFail" field.
  List<String>? _passFail;
  List<String> get passFail => _passFail ?? const [];
  bool hasPassFail() => _passFail != null;

  // "note" field.
  List<String>? _note;
  List<String> get note => _note ?? const [];
  bool hasNote() => _note != null;

  void _initializeFields() {
    _parentTest = snapshotData['parentTest'] as DocumentReference?;
    _dateRun = snapshotData['dateRun'] as DateTime?;
    _passFail = getDataList(snapshotData['passFail']);
    _note = getDataList(snapshotData['note']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TestRuns');

  static Stream<RunsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RunsRecord.fromSnapshot(s));

  static Future<RunsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RunsRecord.fromSnapshot(s));

  static RunsRecord fromSnapshot(DocumentSnapshot snapshot) => RunsRecord._(
    snapshot.reference,
    mapFromFirestore(snapshot.data() as Map<String, dynamic>),
  );

  static RunsRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      RunsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RunsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RunsRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRunsRecordData({
  DocumentReference? parentTest,
  DateTime? dateRun,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parentTest': parentTest,
      'dateRun': dateRun,
    }.withoutNulls,
  );

  return firestoreData;
}

class RunsRecordDocumentEquality implements Equality<RunsRecord> {
  const RunsRecordDocumentEquality();

  @override
  bool equals(RunsRecord? e1, RunsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.parentTest == e2?.parentTest &&
        e1?.dateRun == e2?.dateRun &&
        listEquality.equals(e1?.passFail, e2?.passFail) &&
        listEquality.equals(e1?.note, e2?.note);
  }

  @override
  int hash(RunsRecord? e) => const ListEquality()
      .hash([e?.parentTest, e?.dateRun, e?.passFail, e?.note]);

  @override
  bool isValidKey(Object? o) => o is RunsRecord;
}
