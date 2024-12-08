import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loaded_tweets_widget.dart' show LoadedTweetsWidget;
import 'package:flutter/material.dart';

class LoadedTweetsModel extends FlutterFlowModel<LoadedTweetsWidget> {
  ///  Local state fields for this page.

  dynamic screenname;

  ///  State fields for stateful widgets in this page.

  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
