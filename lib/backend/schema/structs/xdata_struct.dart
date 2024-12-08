// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class XdataStruct extends FFFirebaseStruct {
  XdataStruct({
    String? id,
    String? name,
    String? username,
    String? profileImageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _username = username,
        _profileImageUrl = profileImageUrl,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "profile_image_url" field.
  String? _profileImageUrl;
  String get profileImageUrl => _profileImageUrl ?? '';
  set profileImageUrl(String? val) => _profileImageUrl = val;

  bool hasProfileImageUrl() => _profileImageUrl != null;

  static XdataStruct fromMap(Map<String, dynamic> data) => XdataStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        username: data['username'] as String?,
        profileImageUrl: data['profile_image_url'] as String?,
      );

  static XdataStruct? maybeFromMap(dynamic data) =>
      data is Map ? XdataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'username': _username,
        'profile_image_url': _profileImageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'profile_image_url': serializeParam(
          _profileImageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static XdataStruct fromSerializableMap(Map<String, dynamic> data) =>
      XdataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        profileImageUrl: deserializeParam(
          data['profile_image_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'XdataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is XdataStruct &&
        id == other.id &&
        name == other.name &&
        username == other.username &&
        profileImageUrl == other.profileImageUrl;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, username, profileImageUrl]);
}

XdataStruct createXdataStruct({
  String? id,
  String? name,
  String? username,
  String? profileImageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    XdataStruct(
      id: id,
      name: name,
      username: username,
      profileImageUrl: profileImageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

XdataStruct? updateXdataStruct(
  XdataStruct? xdata, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    xdata
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addXdataStructData(
  Map<String, dynamic> firestoreData,
  XdataStruct? xdata,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (xdata == null) {
    return;
  }
  if (xdata.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && xdata.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final xdataData = getXdataFirestoreData(xdata, forFieldValue);
  final nestedData = xdataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = xdata.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getXdataFirestoreData(
  XdataStruct? xdata, [
  bool forFieldValue = false,
]) {
  if (xdata == null) {
    return {};
  }
  final firestoreData = mapToFirestore(xdata.toMap());

  // Add any Firestore field values
  xdata.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getXdataListFirestoreData(
  List<XdataStruct>? xdatas,
) =>
    xdatas?.map((e) => getXdataFirestoreData(e, true)).toList() ?? [];
