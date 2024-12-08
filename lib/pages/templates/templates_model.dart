import '/components/navbar/navbar_widget.dart';
import '/components/template_scroll_edit_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'templates_widget.dart' show TemplatesWidget;
import 'package:flutter/material.dart';

class TemplatesModel extends FlutterFlowModel<TemplatesWidget> {
  ///  Local state fields for this page.

  bool? searchActive = false;

  ///  State fields for stateful widgets in this page.

  // Model for TemplateScrollEdit component.
  late TemplateScrollEditModel templateScrollEditModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for navbar component.
  late NavbarModel navbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    templateScrollEditModel =
        createModel(context, () => TemplateScrollEditModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    templateScrollEditModel.dispose();
    navbarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
