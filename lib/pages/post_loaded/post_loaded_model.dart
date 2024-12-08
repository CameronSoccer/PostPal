import '/backend/backend.dart';
import '/components/generations_remaining_text/generations_remaining_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_loaded_widget.dart' show PostLoadedWidget;
import 'package:flutter/material.dart';

class PostLoadedModel extends FlutterFlowModel<PostLoadedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for GenerationsRemainingText component.
  late GenerationsRemainingTextModel generationsRemainingTextModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ImagesRecord? imageRef;

  @override
  void initState(BuildContext context) {
    generationsRemainingTextModel =
        createModel(context, () => GenerationsRemainingTextModel());
  }

  @override
  void dispose() {
    generationsRemainingTextModel.dispose();
  }
}
