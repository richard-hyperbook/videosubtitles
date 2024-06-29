import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RunStepsRecord extends FirestoreRecord {
  RunStepsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "parentRun" field.
  DocumentReference? _parentRun;
  DocumentReference? get parentRun => _parentRun;
  bool hasParentRun() => _parentRun != null;

  // "isPass" field.
  bool? _isPass;
  bool get isPass => _isPass ?? false;
  bool hasIsPass() => _isPass != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  void _initializeFields() {
    _parentRun = snapshotData['parentRun'] as DocumentReference?;
    _isPass = snapshotData['isPass'] as bool?;
    _comments = snapshotData['comments'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RunSteps');

  static Stream<RunStepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RunStepsRecord.fromSnapshot(s));

  static Future<RunStepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RunStepsRecord.fromSnapshot(s));

  static RunStepsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RunStepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RunStepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RunStepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RunStepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RunStepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRunStepsRecordData({
  DocumentReference? parentRun,
  bool? isPass,
  String? comments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parentRun': parentRun,
      'isPass': isPass,
      'comments': comments,
    }.withoutNulls,
  );

  return firestoreData;
}

class RunStepsRecordDocumentEquality implements Equality<RunStepsRecord> {
  const RunStepsRecordDocumentEquality();

  @override
  bool equals(RunStepsRecord? e1, RunStepsRecord? e2) {
    return e1?.parentRun == e2?.parentRun &&
        e1?.isPass == e2?.isPass &&
        e1?.comments == e2?.comments;
  }

  @override
  int hash(RunStepsRecord? e) =>
      const ListEquality().hash([e?.parentRun, e?.isPass, e?.comments]);

  @override
  bool isValidKey(Object? o) => o is RunStepsRecord;
}
