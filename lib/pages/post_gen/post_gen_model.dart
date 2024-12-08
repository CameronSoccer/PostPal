import '/components/generations_remaining_text/generations_remaining_text_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/template_scroll_ref_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'post_gen_widget.dart' show PostGenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PostGenModel extends FlutterFlowModel<PostGenWidget> {
  ///  Local state fields for this page.

  String? imageStyle = '';

  String imageSize = '1024x1024';

  dynamic tweetinfo;

  String? newphoto;

  bool isvideo = true;

  Color? pickedcolor;

  String? chosenvoice;

  bool aiVoice = true;

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

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  Color? colorPicked;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // Model for TemplateScrollRef component.
  late TemplateScrollRefModel templateScrollRefModel;
  // Model for GenerationsRemainingText component.
  late GenerationsRemainingTextModel generationsRemainingTextModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    templateScrollRefModel =
        createModel(context, () => TemplateScrollRefModel());
    generationsRemainingTextModel =
        createModel(context, () => GenerationsRemainingTextModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    imagePromptFocusNode?.dispose();
    imagePromptTextController?.dispose();

    templateScrollRefModel.dispose();
    generationsRemainingTextModel.dispose();
    navbarModel.dispose();
  }
}
