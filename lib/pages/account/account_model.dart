import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'account_widget.dart' show AccountWidget;
import 'package:flutter/material.dart';

class AccountModel extends FlutterFlowModel<AccountWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (oauth)] action in Container widget.
  ApiCallResponse? apiResultonp;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  AdminRecord? adminDocument;
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
