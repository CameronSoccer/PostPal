import '/components/generations_remaining_text/generations_remaining_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_template_widget.dart' show CreateTemplateWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateTemplateModel extends FlutterFlowModel<CreateTemplateWidget> {
  ///  Local state fields for this page.

  String? imageStyle = '';

  String imageSize = '1024x1024';

  String? newphoto;

  bool isvideo = true;

  Color? pickedcolor;

  String? chosenvoice;

  String? aiVoice;

  bool dynamicProfile = true;

  bool dynamicPostText = true;

  bool watermark = true;

  FFUploadedFile? backgroundImage;

  bool aiHave = true;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  final textFieldMask2 = MaskTextInputFormatter(mask: '@');
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for imagePrompt widget.
  FocusNode? imagePromptFocusNode;
  TextEditingController? imagePromptTextController;
  String? Function(BuildContext, String?)? imagePromptTextControllerValidator;
  // State field(s) for DropDownVoice widget.
  String? dropDownVoiceValue;
  FormFieldController<String>? dropDownVoiceValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for DropDownBG widget.
  String? dropDownBGValue;
  FormFieldController<String>? dropDownBGValueController;
  Color? colorPicked;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // State field(s) for Nameinput widget.
  FocusNode? nameinputFocusNode;
  TextEditingController? nameinputTextController;
  String? Function(BuildContext, String?)? nameinputTextControllerValidator;
  // Model for GenerationsRemainingText component.
  late GenerationsRemainingTextModel generationsRemainingTextModel;

  @override
  void initState(BuildContext context) {
    generationsRemainingTextModel =
        createModel(context, () => GenerationsRemainingTextModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    imagePromptFocusNode?.dispose();
    imagePromptTextController?.dispose();

    nameinputFocusNode?.dispose();
    nameinputTextController?.dispose();

    generationsRemainingTextModel.dispose();
  }
}
