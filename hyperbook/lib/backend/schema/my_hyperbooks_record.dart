import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyHyperbooksRecord extends FirestoreRecord {
  MyHyperbooksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hyperbook" field.
  DocumentReference? _hyperbook;
  DocumentReference? get hyperbook => _hyperbook;
  bool hasHyperbook() => _hyperbook != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "sendUpdateNotifications" field.
  bool? _sendUpdateNotifications;
  bool get sendUpdateNotifications => _sendUpdateNotifications ?? false;
  bool hasSendUpdateNotifications() => _sendUpdateNotifications != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _hyperbook = snapshotData['hyperbook'] as DocumentReference?;
    _role = snapshotData['role'] as String?;
    _status = snapshotData['status'] as String?;
    _sendUpdateNotifications = snapshotData['sendUpdateNotifications'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('myHyperbooks')
          : FirebaseFirestore.instance.collectionGroup('myHyperbooks');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('myHyperbooks').doc();

  static Stream<MyHyperbooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyHyperbooksRecord.fromSnapshot(s));

  static Future<MyHyperbooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyHyperbooksRecord.fromSnapshot(s));

  static MyHyperbooksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyHyperbooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyHyperbooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyHyperbooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyHyperbooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyHyperbooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyHyperbooksRecordData({
  DocumentReference? hyperbook,
  String? role,
  String? status,
  bool? sendUpdateNotifications,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hyperbook': hyperbook,
      'role': role,
      'status': status,
      'sendUpdateNotifications': sendUpdateNotifications,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyHyperbooksRecordDocumentEquality
    implements Equality<MyHyperbooksRecord> {
  const MyHyperbooksRecordDocumentEquality();

  @override
  bool equals(MyHyperbooksRecord? e1, MyHyperbooksRecord? e2) {
    return e1?.hyperbook == e2?.hyperbook &&
        e1?.role == e2?.role &&
        e1?.status == e2?.status &&
        e1?.sendUpdateNotifications == e2?.sendUpdateNotifications;
  }

  @override
  int hash(MyHyperbooksRecord? e) => const ListEquality()
      .hash([e?.hyperbook, e?.role, e?.status, e?.sendUpdateNotifications]);

  @override
  bool isValidKey(Object? o) => o is MyHyperbooksRecord;
}
