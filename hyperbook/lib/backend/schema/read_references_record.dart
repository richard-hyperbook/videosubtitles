import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReadReferencesRecord extends FirestoreRecord {
  ReadReferencesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chapter" field.
  DocumentReference? _chapter;
  DocumentReference? get chapter => _chapter;
  bool hasChapter() => _chapter != null;

  // "readStateIndex" field.
  int? _readStateIndex;
  int get readStateIndex => _readStateIndex ?? 0;
  bool hasReadStateIndex() => _readStateIndex != null;

  // "hyperbook" field.
  DocumentReference? _hyperbook;
  DocumentReference? get hyperbook => _hyperbook;
  bool hasHyperbook() => _hyperbook != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _chapter = snapshotData['chapter'] as DocumentReference?;
    _readStateIndex = castToType<int>(snapshotData['readStateIndex']);
    _hyperbook = snapshotData['hyperbook'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('readReferences')
          : FirebaseFirestore.instance.collectionGroup('readReferences');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('readReferences').doc();

  static Stream<ReadReferencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReadReferencesRecord.fromSnapshot(s));

  static Future<ReadReferencesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReadReferencesRecord.fromSnapshot(s));

  static ReadReferencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReadReferencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReadReferencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReadReferencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReadReferencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReadReferencesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReadReferencesRecordData({
  DocumentReference? chapter,
  int? readStateIndex,
  DocumentReference? hyperbook,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chapter': chapter,
      'readStateIndex': readStateIndex,
      'hyperbook': hyperbook,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReadReferencesRecordDocumentEquality
    implements Equality<ReadReferencesRecord> {
  const ReadReferencesRecordDocumentEquality();

  @override
  bool equals(ReadReferencesRecord? e1, ReadReferencesRecord? e2) {
    return e1?.chapter == e2?.chapter &&
        e1?.readStateIndex == e2?.readStateIndex &&
        e1?.hyperbook == e2?.hyperbook;
  }

  @override
  int hash(ReadReferencesRecord? e) =>
      const ListEquality().hash([e?.chapter, e?.readStateIndex, e?.hyperbook]);

  @override
  bool isValidKey(Object? o) => o is ReadReferencesRecord;
}
