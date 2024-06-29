import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestsRecord extends FirestoreRecord {
  TestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "testName" field.
  String? _testName;
  String get testName => _testName ?? '';
  bool hasTestName() => _testName != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "dateModified" field.
  DateTime? _dateModified;
  DateTime? get dateModified => _dateModified;
  bool hasDateModified() => _dateModified != null;

  void _initializeFields() {
    _testName = snapshotData['testName'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _dateModified = snapshotData['dateModified'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tests');

  static Stream<TestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestsRecord.fromSnapshot(s));

  static Future<TestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestsRecord.fromSnapshot(s));

  static TestsRecord fromSnapshot(DocumentSnapshot snapshot) => TestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestsRecordData({
  String? testName,
  DateTime? dateCreated,
  DateTime? dateModified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'testName': testName,
      'dateCreated': dateCreated,
      'dateModified': dateModified,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestsRecordDocumentEquality implements Equality<TestsRecord> {
  const TestsRecordDocumentEquality();

  @override
  bool equals(TestsRecord? e1, TestsRecord? e2) {
    return e1?.testName == e2?.testName &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.dateModified == e2?.dateModified;
  }

  @override
  int hash(TestsRecord? e) =>
      const ListEquality().hash([e?.testName, e?.dateCreated, e?.dateModified]);

  @override
  bool isValidKey(Object? o) => o is TestsRecord;
}
