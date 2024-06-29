import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestStepsRecord extends FirestoreRecord {
  TestStepsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "parentTest" field.
  DocumentReference? _parentTest;
  DocumentReference? get parentTest => _parentTest;
  bool hasParentTest() => _parentTest != null;

  // "index" field.
  double? _index;
  double get index => _index ?? 0.0;
  bool hasIndex() => _index != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "screenshot" field.
  String? _screenshot;
  String get screenshot => _screenshot ?? '';
  bool hasScreenshot() => _screenshot != null;

  // "passCriteria" field.
  String? _passCriteria;
  String get passCriteria => _passCriteria ?? '';
  bool hasPassCriteria() => _passCriteria != null;

  void _initializeFields() {
    _parentTest = snapshotData['parentTest'] as DocumentReference?;
    _index = castToType<double>(snapshotData['index']);
    _description = snapshotData['description'] as String?;
    _screenshot = snapshotData['screenshot'] as String?;
    _passCriteria = snapshotData['passCriteria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TestSteps');

  static Stream<TestStepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestStepsRecord.fromSnapshot(s));

  static Future<TestStepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestStepsRecord.fromSnapshot(s));

  static TestStepsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestStepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestStepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestStepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestStepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestStepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestStepsRecordData({
  DocumentReference? parentTest,
  double? index,
  String? description,
  String? screenshot,
  String? passCriteria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parentTest': parentTest,
      'index': index,
      'description': description,
      'screenshot': screenshot,
      'passCriteria': passCriteria,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestStepsRecordDocumentEquality implements Equality<TestStepsRecord> {
  const TestStepsRecordDocumentEquality();

  @override
  bool equals(TestStepsRecord? e1, TestStepsRecord? e2) {
    return e1?.parentTest == e2?.parentTest &&
        e1?.index == e2?.index &&
        e1?.description == e2?.description &&
        e1?.screenshot == e2?.screenshot &&
        e1?.passCriteria == e2?.passCriteria;
  }

  @override
  int hash(TestStepsRecord? e) => const ListEquality().hash([
        e?.parentTest,
        e?.index,
        e?.description,
        e?.screenshot,
        e?.passCriteria
      ]);

  @override
  bool isValidKey(Object? o) => o is TestStepsRecord;
}
