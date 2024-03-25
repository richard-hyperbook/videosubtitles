import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryCollectionRecord extends FirestoreRecord {
  HistoryCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "parent" field.
  DocumentReference? _parent;
  DocumentReference? get parent => _parent;
  bool hasParent() => _parent != null;

  void _initializeFields() {
    _index = castToType<int>(snapshotData['index']);
    _action = snapshotData['action'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _parent = snapshotData['parent'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('historyCollection');

  static Stream<HistoryCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryCollectionRecord.fromSnapshot(s));

  static Future<HistoryCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HistoryCollectionRecord.fromSnapshot(s));

  static HistoryCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryCollectionRecordData({
  int? index,
  String? action,
  DateTime? dateTime,
  DocumentReference? parent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'index': index,
      'action': action,
      'dateTime': dateTime,
      'parent': parent,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryCollectionRecordDocumentEquality
    implements Equality<HistoryCollectionRecord> {
  const HistoryCollectionRecordDocumentEquality();

  @override
  bool equals(HistoryCollectionRecord? e1, HistoryCollectionRecord? e2) {
    return e1?.index == e2?.index &&
        e1?.action == e2?.action &&
        e1?.dateTime == e2?.dateTime &&
        e1?.parent == e2?.parent;
  }

  @override
  int hash(HistoryCollectionRecord? e) =>
      const ListEquality().hash([e?.index, e?.action, e?.dateTime, e?.parent]);

  @override
  bool isValidKey(Object? o) => o is HistoryCollectionRecord;
}
