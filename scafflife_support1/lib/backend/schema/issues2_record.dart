import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Issues2Record extends FirestoreRecord {
  Issues2Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "issueTitle" field.
  String? _issueTitle;
  String get issueTitle => _issueTitle ?? '';
  bool hasIssueTitle() => _issueTitle != null;

  // "issueDescription" field.
  String? _issueDescription;
  String get issueDescription => _issueDescription ?? '';
  bool hasIssueDescription() => _issueDescription != null;

  // "dateRaised" field.
  DateTime? _dateRaised;
  DateTime? get dateRaised => _dateRaised;
  bool hasDateRaised() => _dateRaised != null;

  // "versionSoftwareRaised" field.
  int? _versionSoftwareRaised;
  int get versionSoftwareRaised => _versionSoftwareRaised ?? 0;
  bool hasVersionSoftwareRaised() => _versionSoftwareRaised != null;

  // "versionSoftwareFixed" field.
  int? _versionSoftwareFixed;
  int get versionSoftwareFixed => _versionSoftwareFixed ?? 0;
  bool hasVersionSoftwareFixed() => _versionSoftwareFixed != null;

  // "dateFixed" field.
  DateTime? _dateFixed;
  DateTime? get dateFixed => _dateFixed;
  bool hasDateFixed() => _dateFixed != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "ticketNumber" field.
  int? _ticketNumber;
  int get ticketNumber => _ticketNumber ?? 0;
  bool hasTicketNumber() => _ticketNumber != null;

  // "raisedBy" field.
  String? _raisedBy;
  String get raisedBy => _raisedBy ?? '';
  bool hasRaisedBy() => _raisedBy != null;

  // "urgency" field.
  String? _urgency;
  String get urgency => _urgency ?? '';
  bool hasUrgency() => _urgency != null;

  // "screenshot" field.
  String? _screenshot;
  String get screenshot => _screenshot ?? '';
  bool hasScreenshot() => _screenshot != null;

  void _initializeFields() {
    _issueTitle = snapshotData['issueTitle'] as String?;
    _issueDescription = snapshotData['issueDescription'] as String?;
    _dateRaised = snapshotData['dateRaised'] as DateTime?;
    _versionSoftwareRaised =
        castToType<int>(snapshotData['versionSoftwareRaised']);
    _versionSoftwareFixed =
        castToType<int>(snapshotData['versionSoftwareFixed']);
    _dateFixed = snapshotData['dateFixed'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _notes = snapshotData['notes'] as String?;
    _ticketNumber = castToType<int>(snapshotData['ticketNumber']);
    _raisedBy = snapshotData['raisedBy'] as String?;
    _urgency = snapshotData['urgency'] as String?;
    _screenshot = snapshotData['screenshot'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('issues2');

  static Stream<Issues2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Issues2Record.fromSnapshot(s));

  static Future<Issues2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Issues2Record.fromSnapshot(s));

  static Issues2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Issues2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Issues2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Issues2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Issues2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Issues2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIssues2RecordData({
  String? issueTitle,
  String? issueDescription,
  DateTime? dateRaised,
  int? versionSoftwareRaised,
  int? versionSoftwareFixed,
  DateTime? dateFixed,
  String? status,
  String? notes,
  int? ticketNumber,
  String? raisedBy,
  String? urgency,
  String? screenshot,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'issueTitle': issueTitle,
      'issueDescription': issueDescription,
      'dateRaised': dateRaised,
      'versionSoftwareRaised': versionSoftwareRaised,
      'versionSoftwareFixed': versionSoftwareFixed,
      'dateFixed': dateFixed,
      'status': status,
      'notes': notes,
      'ticketNumber': ticketNumber,
      'raisedBy': raisedBy,
      'urgency': urgency,
      'screenshot': screenshot,
    }.withoutNulls,
  );

  return firestoreData;
}

class Issues2RecordDocumentEquality implements Equality<Issues2Record> {
  const Issues2RecordDocumentEquality();

  @override
  bool equals(Issues2Record? e1, Issues2Record? e2) {
    return e1?.issueTitle == e2?.issueTitle &&
        e1?.issueDescription == e2?.issueDescription &&
        e1?.dateRaised == e2?.dateRaised &&
        e1?.versionSoftwareRaised == e2?.versionSoftwareRaised &&
        e1?.versionSoftwareFixed == e2?.versionSoftwareFixed &&
        e1?.dateFixed == e2?.dateFixed &&
        e1?.status == e2?.status &&
        e1?.notes == e2?.notes &&
        e1?.ticketNumber == e2?.ticketNumber &&
        e1?.raisedBy == e2?.raisedBy &&
        e1?.urgency == e2?.urgency &&
        e1?.screenshot == e2?.screenshot;
  }

  @override
  int hash(Issues2Record? e) => const ListEquality().hash([
        e?.issueTitle,
        e?.issueDescription,
        e?.dateRaised,
        e?.versionSoftwareRaised,
        e?.versionSoftwareFixed,
        e?.dateFixed,
        e?.status,
        e?.notes,
        e?.ticketNumber,
        e?.raisedBy,
        e?.urgency,
        e?.screenshot
      ]);

  @override
  bool isValidKey(Object? o) => o is Issues2Record;
}
