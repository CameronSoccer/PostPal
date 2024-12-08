import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_album_widget.dart' show NewAlbumWidget;
import 'package:flutter/material.dart';

class NewAlbumModel extends FlutterFlowModel<NewAlbumWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for folderTitle widget.
  FocusNode? folderTitleFocusNode1;
  TextEditingController? folderTitleTextController1;
  String? Function(BuildContext, String?)? folderTitleTextController1Validator;
  String? _folderTitleTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5t47wlr7' /* Title is required. */,
      );
    }

    return null;
  }

  // State field(s) for folderTitle widget.
  FocusNode? folderTitleFocusNode2;
  TextEditingController? folderTitleTextController2;
  String? Function(BuildContext, String?)? folderTitleTextController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Annual widget.
  AlbumsRecord? album;

  @override
  void initState(BuildContext context) {
    folderTitleTextController1Validator = _folderTitleTextController1Validator;
  }

  @override
  void dispose() {
    folderTitleFocusNode1?.dispose();
    folderTitleTextController1?.dispose();

    folderTitleFocusNode2?.dispose();
    folderTitleTextController2?.dispose();
  }
}
