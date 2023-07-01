import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConnectedUsersRecord extends FirestoreRecord {
  ConnectedUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('connectedUsers')
          : FirebaseFirestore.instance.collectionGroup('connectedUsers');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('connectedUsers').doc();

  static Stream<ConnectedUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConnectedUsersRecord.fromSnapshot(s));

  static Future<ConnectedUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConnectedUsersRecord.fromSnapshot(s));

  static ConnectedUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConnectedUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConnectedUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConnectedUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConnectedUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConnectedUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConnectedUsersRecordData({
  DocumentReference? user,
  String? status,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'status': status,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConnectedUsersRecordDocumentEquality
    implements Equality<ConnectedUsersRecord> {
  const ConnectedUsersRecordDocumentEquality();

  @override
  bool equals(ConnectedUsersRecord? e1, ConnectedUsersRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.status == e2?.status &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(ConnectedUsersRecord? e) =>
      const ListEquality().hash([e?.user, e?.status, e?.displayName]);

  @override
  bool isValidKey(Object? o) => o is ConnectedUsersRecord;
}
