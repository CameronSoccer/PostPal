import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_profile_model.dart';
export 'onboarding_profile_model.dart';

class OnboardingProfileWidget extends StatefulWidget {
  const OnboardingProfileWidget({super.key});

  @override
  State<OnboardingProfileWidget> createState() =>
      _OnboardingProfileWidgetState();
}

class _OnboardingProfileWidgetState extends State<OnboardingProfileWidget>
    with TickerProviderStateMixin {
  late OnboardingProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding_Profile'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.firstNameTextController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();
    _model.lastNameFocusNode!.addListener(
      () async {
        logFirebaseEvent('ONBOARDING_PROFILE_last_name_ON_FOCUS_CH');
        logFirebaseEvent('last_name_update_page_state');
        _model.username1 =
            '${_model.firstNameTextController.text}${(String lastName) {
          return lastName[0];
        }(_model.lastNameTextController.text)}${random_data.randomInteger(10, 99).toString()}';
        _model.username2 = '${(String firstName) {
          return firstName[0];
        }(_model.firstNameTextController.text)}${_model.lastNameTextController.text}${random_data.randomInteger(10, 99).toString()}';
        _model.username3 =
            '${_model.firstNameTextController.text}${random_data.randomInteger(1000, 9999).toString()}';
        safeSetState(() {});
      },
    );
    _model.nicknameTextController ??= TextEditingController();
    _model.nicknameFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'zte082q6' /* Customize your profile */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'lf9tgr4o' /* Add your profile details below... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ONBOARDING_PROFILE_Container_v66javkg_ON');
                                    logFirebaseEvent(
                                        'Container_upload_media_to_firebase');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 1000.00,
                                      maxHeight: 1000.00,
                                      imageQuality: 90,
                                      allowPhoto: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      pickerFontFamily: 'Sora',
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        safeSetState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }

                                    if (_model.uploadedFileUrl != '') {
                                      logFirebaseEvent(
                                          'Container_update_page_state');
                                      _model.profilePicture =
                                          _model.uploadedFileUrl;
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 120.0,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            _model.profilePicture,
                                            'false',
                                          ),
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Visibility(
                                      visible: _model.profilePicture == null ||
                                          _model.profilePicture == '',
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.upload_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 36.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 24.0)),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        controller:
                                            _model.firstNameTextController,
                                        focusNode: _model.firstNameFocusNode,
                                        autofocus: false,
                                        autofillHints: const [
                                          AutofillHints.givenName
                                        ],
                                        textCapitalization:
                                            TextCapitalization.words,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '806chf8j' /* First name */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .firstNameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        controller:
                                            _model.lastNameTextController,
                                        focusNode: _model.lastNameFocusNode,
                                        autofocus: false,
                                        autofillHints: const [
                                          AutofillHints.familyName
                                        ],
                                        textCapitalization:
                                            TextCapitalization.words,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '3s25dejy' /* Last name */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .lastNameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.nicknameTextController,
                                    focusNode: _model.nicknameFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.nicknameTextController',
                                      const Duration(milliseconds: 400),
                                      () => safeSetState(() {}),
                                    ),
                                    autofocus: false,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'r07lmjc9' /* Nickname */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    maxLength: 20,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .nicknameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                if ((_model.firstNameTextController.text !=
                                            '') &&
                                    (_model.lastNameTextController.text !=
                                            ''))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'razzzfb3' /* NICKNAME IDEAS */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              fontSize: 10.0,
                                              letterSpacing: 1.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily),
                                            ),
                                      ),
                                      Wrap(
                                        spacing: 6.0,
                                        runSpacing: 6.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ONBOARDING_PROFILE_Container_p53njwdt_ON');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'Container_set_form_field');
                                              safeSetState(() {
                                                _model.nicknameTextController
                                                    ?.text = _model.username1!;
                                                _model.nicknameFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.nicknameTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .nicknameTextController!
                                                        .text
                                                        .length,
                                                  );
                                                });
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    _model.nicknameTextController
                                                                .text ==
                                                            _model.username1
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 8.0, 12.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.username1,
                                                        'nickname',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: _model
                                                                            .nicknameTextController
                                                                            .text ==
                                                                        _model
                                                                            .username1
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ONBOARDING_PROFILE_Container_w6d39znd_ON');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'Container_set_form_field');
                                              safeSetState(() {
                                                _model.nicknameTextController
                                                    ?.text = _model.username2!;
                                                _model.nicknameFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.nicknameTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .nicknameTextController!
                                                        .text
                                                        .length,
                                                  );
                                                });
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    _model.nicknameTextController
                                                                .text ==
                                                            _model.username2
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 8.0, 12.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.username2,
                                                        'nickname',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: _model
                                                                            .nicknameTextController
                                                                            .text ==
                                                                        _model
                                                                            .username2
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ONBOARDING_PROFILE_Container_fkzwx9rz_ON');
                                              logFirebaseEvent(
                                                  'Container_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'Container_set_form_field');
                                              safeSetState(() {
                                                _model.nicknameTextController
                                                    ?.text = _model.username3!;
                                                _model.nicknameFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.nicknameTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .nicknameTextController!
                                                        .text
                                                        .length,
                                                  );
                                                });
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    _model.nicknameTextController
                                                                .text ==
                                                            _model.username3
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 8.0, 12.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.username3,
                                                        'nickname',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: _model
                                                                            .nicknameTextController
                                                                            .text ==
                                                                        _model
                                                                            .username3
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 6.0)),
                                  ),
                              ].divide(const SizedBox(height: 12.0)),
                            ),
                          ].divide(const SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                    if (!(isWeb
                        ? MediaQuery.viewInsetsOf(context).bottom > 0
                        : _isKeyboardVisible))
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ONBOARDING_PROFILE_CONTINUE_BTN_ON_TAP');
                          logFirebaseEvent('Button_haptic_feedback');
                          HapticFeedback.lightImpact();
                          logFirebaseEvent('Button_validate_form');
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            displayName: _model.nicknameTextController.text,
                            firstName: _model.firstNameTextController.text,
                            lastName: _model.lastNameTextController.text,
                            photoUrl: _model.profilePicture,
                          ));
                          logFirebaseEvent('Button_navigate_to');

                          context.goNamed('Onboarding_Instructions');
                        },
                        text: FFLocalizations.of(context).getText(
                          'spc42q3x' /* Continue */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 55.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
