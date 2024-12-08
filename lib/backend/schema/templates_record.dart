import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TemplatesRecord extends FirestoreRecord {
  TemplatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "dynamic_profile" field.
  bool? _dynamicProfile;
  bool get dynamicProfile => _dynamicProfile ?? false;
  bool hasDynamicProfile() => _dynamicProfile != null;

  // "dynamic_text" field.
  bool? _dynamicText;
  bool get dynamicText => _dynamicText ?? false;
  bool hasDynamicText() => _dynamicText != null;

  // "video" field.
  bool? _video;
  bool get video => _video ?? false;
  bool hasVideo() => _video != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "background" field.
  String? _background;
  String get background => _background ?? '';
  bool hasBackground() => _background != null;

  // "watermark" field.
  bool? _watermark;
  bool get watermark => _watermark ?? false;
  bool hasWatermark() => _watermark != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ai_voice" field.
  String? _aiVoice;
  String get aiVoice => _aiVoice ?? '';
  bool hasAiVoice() => _aiVoice != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "background_file" field.
  String? _backgroundFile;
  String get backgroundFile => _backgroundFile ?? '';
  bool hasBackgroundFile() => _backgroundFile != null;

  // "ai_have" field.
  bool? _aiHave;
  bool get aiHave => _aiHave ?? false;
  bool hasAiHave() => _aiHave != null;

  // "bg_type" field.
  String? _bgType;
  String get bgType => _bgType ?? '';
  bool hasBgType() => _bgType != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _dynamicProfile = snapshotData['dynamic_profile'] as bool?;
    _dynamicText = snapshotData['dynamic_text'] as bool?;
    _video = snapshotData['video'] as bool?;
    _size = snapshotData['size'] as String?;
    _color = getSchemaColor(snapshotData['color']);
    _background = snapshotData['background'] as String?;
    _watermark = snapshotData['watermark'] as bool?;
    _name = snapshotData['name'] as String?;
    _aiVoice = snapshotData['ai_voice'] as String?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _backgroundFile = snapshotData['background_file'] as String?;
    _aiHave = snapshotData['ai_have'] as bool?;
    _bgType = snapshotData['bg_type'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('templates');

  static Stream<TemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TemplatesRecord.fromSnapshot(s));

  static Future<TemplatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TemplatesRecord.fromSnapshot(s));

  static TemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTemplatesRecordData({
  bool? dynamicProfile,
  bool? dynamicText,
  bool? video,
  String? size,
  Color? color,
  String? background,
  bool? watermark,
  String? name,
  String? aiVoice,
  DocumentReference? creator,
  String? backgroundFile,
  bool? aiHave,
  String? bgType,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dynamic_profile': dynamicProfile,
      'dynamic_text': dynamicText,
      'video': video,
      'size': size,
      'color': color,
      'background': background,
      'watermark': watermark,
      'name': name,
      'ai_voice': aiVoice,
      'creator': creator,
      'background_file': backgroundFile,
      'ai_have': aiHave,
      'bg_type': bgType,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class TemplatesRecordDocumentEquality implements Equality<TemplatesRecord> {
  const TemplatesRecordDocumentEquality();

  @override
  bool equals(TemplatesRecord? e1, TemplatesRecord? e2) {
    return e1?.dynamicProfile == e2?.dynamicProfile &&
        e1?.dynamicText == e2?.dynamicText &&
        e1?.video == e2?.video &&
        e1?.size == e2?.size &&
        e1?.color == e2?.color &&
        e1?.background == e2?.background &&
        e1?.watermark == e2?.watermark &&
        e1?.name == e2?.name &&
        e1?.aiVoice == e2?.aiVoice &&
        e1?.creator == e2?.creator &&
        e1?.backgroundFile == e2?.backgroundFile &&
        e1?.aiHave == e2?.aiHave &&
        e1?.bgType == e2?.bgType &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(TemplatesRecord? e) => const ListEquality().hash([
        e?.dynamicProfile,
        e?.dynamicText,
        e?.video,
        e?.size,
        e?.color,
        e?.background,
        e?.watermark,
        e?.name,
        e?.aiVoice,
        e?.creator,
        e?.backgroundFile,
        e?.aiHave,
        e?.bgType,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is TemplatesRecord;
}
