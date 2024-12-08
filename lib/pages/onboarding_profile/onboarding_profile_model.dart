import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_profile_widget.dart' show OnboardingProfileWidget;
import 'package:flutter/material.dart';

class OnboardingProfileModel extends FlutterFlowModel<OnboardingProfileWidget> {
  ///  Local state fields for this page.

  String? profilePicture;

  String? username1 = '';

  String? username2 = '';

  String? username3 = '';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for first_name widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z80dp9kp' /* First name is required. */,
      );
    }

    return null;
  }

  // State field(s) for last_name widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kpzghah7' /* Last name is required. */,
      );
    }

    return null;
  }

  // State field(s) for nickname widget.
  FocusNode? nicknameFocusNode;
  TextEditingController? nicknameTextController;
  String? Function(BuildContext, String?)? nicknameTextControllerValidator;
  String? _nicknameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pkkj80zk' /* Nickname is required. */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    nicknameTextControllerValidator = _nicknameTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    nicknameFocusNode?.dispose();
    nicknameTextController?.dispose();
  }
}
