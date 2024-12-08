import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/template_scroll_ref_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'automation_widget.dart' show AutomationWidget;
import 'package:flutter/material.dart';

class AutomationModel extends FlutterFlowModel<AutomationWidget> {
  ///  Local state fields for this page.

  DocumentReference? pickedtemp;

  String? pickedtempname;

  TemplatesRecord? temp2;

  ///  State fields for stateful widgets in this page.

  // Model for TemplateScrollRef component.
  late TemplateScrollRefModel templateScrollRefModel;
  // State field(s) for DropDownsize widget.
  String? dropDownsizeValue;
  FormFieldController<String>? dropDownsizeValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    templateScrollRefModel =
        createModel(context, () => TemplateScrollRefModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    templateScrollRefModel.dispose();
    navbarModel.dispose();
  }
}
