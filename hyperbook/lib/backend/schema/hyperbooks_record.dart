import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HyperbooksRecord extends FirestoreRecord {
  HyperbooksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "moderator" field.
  DocumentReference? _moderator;
  DocumentReference? get moderator => _moderator;
  bool hasModerator() => _moderator != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "blurb" field.
  String? _blurb;
  String get blurb => _blurb ?? '';
  bool hasBlurb() => _blurb != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "requiresReaderApproval" field.
  String? _requiresReaderApproval;
  String get requiresReaderApproval => _requiresReaderApproval ?? '';
  bool hasRequiresReaderApproval() => _requiresReaderApproval != null;

  // "startChapter" field.
  DocumentReference? _startChapter;
  DocumentReference? get startChapter => _startChapter;
  bool hasStartChapter() => _startChapter != null;

  // "collabratorPriviledges" field.
  String? _collabratorPriviledges;
  String get collabratorPriviledges => _collabratorPriviledges ?? '';
  bool hasCollabratorPriviledges() => _collabratorPriviledges != null;

  // "visibility" field.
  String? _visibility;
  String get visibility => _visibility ?? '';
  bool hasVisibility() => _visibility != null;

  // "requiresWriterApproval" field.
  String? _requiresWriterApproval;
  String get requiresWriterApproval => _requiresWriterApproval ?? '';
  bool hasRequiresWriterApproval() => _requiresWriterApproval != null;

  void _initializeFields() {
    _moderator = snapshotData['moderator'] as DocumentReference?;
    _members = getDataList(snapshotData['members']);
    _title = snapshotData['title'] as String?;
    _blurb = snapshotData['blurb'] as String?;
    _type = castToType<int>(snapshotData['type']);
    _requiresReaderApproval = snapshotData['requiresReaderApproval'] as String?;
    _startChapter = snapshotData['startChapter'] as DocumentReference?;
    _collabratorPriviledges = snapshotData['collabratorPriviledges'] as String?;
    _visibility = snapshotData['visibility'] as String?;
    _requiresWriterApproval = snapshotData['requiresWriterApproval'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hyperbooks');

  static Stream<HyperbooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HyperbooksRecord.fromSnapshot(s));

  static Future<HyperbooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HyperbooksRecord.fromSnapshot(s));

  static HyperbooksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HyperbooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HyperbooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HyperbooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HyperbooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HyperbooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHyperbooksRecordData({
  DocumentReference? moderator,
  String? title,
  String? blurb,
  int? type,
  String? requiresReaderApproval,
  DocumentReference? startChapter,
  String? collabratorPriviledges,
  String? visibility,
  String? requiresWriterApproval,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'moderator': moderator,
      'title': title,
      'blurb': blurb,
      'type': type,
      'requiresReaderApproval': requiresReaderApproval,
      'startChapter': startChapter,
      'collabratorPriviledges': collabratorPriviledges,
      'visibility': visibility,
      'requiresWriterApproval': requiresWriterApproval,
    }.withoutNulls,
  );

  return firestoreData;
}

class HyperbooksRecordDocumentEquality implements Equality<HyperbooksRecord> {
  const HyperbooksRecordDocumentEquality();

  @override
  bool equals(HyperbooksRecord? e1, HyperbooksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.moderator == e2?.moderator &&
        listEquality.equals(e1?.members, e2?.members) &&
        e1?.title == e2?.title &&
        e1?.blurb == e2?.blurb &&
        e1?.type == e2?.type &&
        e1?.requiresReaderApproval == e2?.requiresReaderApproval &&
        e1?.startChapter == e2?.startChapter &&
        e1?.collabratorPriviledges == e2?.collabratorPriviledges &&
        e1?.visibility == e2?.visibility &&
        e1?.requiresWriterApproval == e2?.requiresWriterApproval;
  }

  @override
  int hash(HyperbooksRecord? e) => const ListEquality().hash([
        e?.moderator,
        e?.members,
        e?.title,
        e?.blurb,
        e?.type,
        e?.requiresReaderApproval,
        e?.startChapter,
        e?.collabratorPriviledges,
        e?.visibility,
        e?.requiresWriterApproval
      ]);

  @override
  bool isValidKey(Object? o) => o is HyperbooksRecord;
}
