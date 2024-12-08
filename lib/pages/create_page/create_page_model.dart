import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_page_widget.dart' show CreatePageWidget;
import 'package:flutter/material.dart';

class CreatePageModel extends FlutterFlowModel<CreatePageWidget> {
  ///  Local state fields for this page.

  String? screenname;

  ///  State fields for stateful widgets in this page.

  // State field(s) for xhandle widget.
  FocusNode? xhandleFocusNode;
  TextEditingController? xhandleTextController;
  String? Function(BuildContext, String?)? xhandleTextControllerValidator;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    xhandleFocusNode?.dispose();
    xhandleTextController?.dispose();

    navbarModel.dispose();
  }
}
