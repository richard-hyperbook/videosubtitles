// @JsonSerializable()
class DocumentReference {
  String? path;
  DocumentReference({this.path = '0'});
  // factory DocumentReference.fromJson(Map<String, dynamic> json) =>
  //     _$DocumentReferenceFromJson(json);
  // Map<String, dynamic> toJson() => _$DocumentReferenceToJson(this);
}


const endpoint = 'https://intelvid.co.uk/v1';

const project = 'simplenotes';
const devKey =
    'c23c3aa177d6e9d01411f35c293991f632fd9f6b90689f03bfa0c9ac2581dc5472d4672c0c573acd1219c712f21fd112d9fd5fd9c4a661e08d5738ee484ec662f7e68995662f3054720c728395700090f6fb4d4f5d5710c0364e0472db6ed29c3f2d2fa4864b366b17e8c69e6c78ebc8b3852883b656747c63d0c44772d25b05';
const imageFilenameHead = endpoint + '/storage/buckets';

final DocumentReference databaseRef = DocumentReference(
  path: '690e256400166acbe04d',
);
final DocumentReference grahoRef = DocumentReference(
  path: '690f62180016e94b5a65',
);
/*
final DocumentReference connectedUsersRef = DocumentReference(
  path: '67d26456000deb78fa6a',
);
final DocumentReference chaptersRef = DocumentReference(
  path: '67d260ec0037564b2569',
);
final DocumentReference usersRef = DocumentReference(
  path: '67e2c962000f5a8055d0',
);
final DocumentReference aaMilneUserRef = DocumentReference(
  path: '67cdf1e76e9881bd3a5c',
);
final DocumentReference readReferencesRef = DocumentReference(
  path: '67ee381100135ad7a75c',
);*/
final DocumentReference graphoStorageRef = DocumentReference(
  path: '691340480015a24b0fb2',
);
/*
final DocumentReference imageStorageRef = DocumentReference(
  path: '680cd737001f208054fb',

);*/