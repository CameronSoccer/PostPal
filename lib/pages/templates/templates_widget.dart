import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dream_brush_image/dream_brush_image_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/paywall/paywall_widget.dart';
import '/components/paywall_confirmation/paywall_confirmation_widget.dart';
import '/components/template_scroll_edit_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'templates_model.dart';
export 'templates_model.dart';

class TemplatesWidget extends StatefulWidget {
  const TemplatesWidget({super.key});

  @override
  State<TemplatesWidget> createState() => _TemplatesWidgetState();
}

class _TemplatesWidgetState extends State<TemplatesWidget> {
  late TemplatesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemplatesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Templates'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('TEMPLATES_PAGE_Text_g34467qm_ON_TAP');
              logFirebaseEvent('Text_navigate_to');

              context.goNamed(
                'CreatePage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            child: Text(
              FFLocalizations.of(context).getText(
                'irdv1bl7' /* PostPal */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleLargeFamily),
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      if (currentUserEmailVerified) {
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TEMPLATES_PAGE_Container_yjga00rm_ON_TAP');
                              logFirebaseEvent('Container_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Container_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const PaywallWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.rocket_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 14.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'syzwckaz' /* UPGRADE */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    'Plus Jakarta Sans'),
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TEMPLATES_PAGE_Container_bdkgw8fa_ON_TAP');
                              logFirebaseEvent('Container_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Container_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const PaywallConfirmationWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome_rounded,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 16.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ws8uiyfi' /* PRO */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    'Plus Jakarta Sans'),
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'TEMPLATES_PAGE_Container_b7ricwba_ON_TAP');
                        logFirebaseEvent('Container_haptic_feedback');
                        HapticFeedback.lightImpact();
                        logFirebaseEvent('Container_navigate_to');

                        context.goNamed(
                          'Account',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              currentUserPhoto,
                            ),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Visibility(
                          visible: currentUserPhoto == '',
                          child: Icon(
                            Icons.person_outline,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(75.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 100.0,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: false,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: FFLocalizations.of(context).getText(
                            '9qndwr7v' /* Search... */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.searchActive ?? false) {
                        return FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).info,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'TEMPLATES_PAGE_close_rounded_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_haptic_feedback');
                            HapticFeedback.selectionClick();
                            logFirebaseEvent(
                                'IconButton_clear_text_fields_pin_codes');
                            safeSetState(() {
                              _model.textController?.clear();
                            });
                            logFirebaseEvent('IconButton_update_page_state');
                            _model.searchActive = false;
                            safeSetState(() {});
                          },
                        );
                      } else {
                        return FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).info,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'TEMPLATES_PAGE_search_rounded_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_haptic_feedback');
                            HapticFeedback.selectionClick();
                            logFirebaseEvent('IconButton_update_page_state');
                            _model.searchActive = true;
                            safeSetState(() {});
                          },
                        );
                      }
                    },
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'TEMPLATES_CREATE_A_NEW_TEMPLATE_BTN_ON_T');
                              logFirebaseEvent('Button_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('CreateTemplate');
                            },
                            text: FFLocalizations.of(context).getText(
                              'ni3uychr' /* Create a New Template */,
                            ),
                            icon: const Icon(
                              Icons.dashboard_rounded,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconAlignment: IconAlignment.end,
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
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ),
                      if (!_model.searchActive!)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '8yf1lvp0' /* Your Templates */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'TEMPLATES_PAGE_Row_zg8ywjeu_ON_TAP');
                                        logFirebaseEvent('Row_haptic_feedback');
                                        HapticFeedback.lightImpact();
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed('ImageStyles');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'pw5n3hnp' /* SEE ALL */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          'Plus Jakarta Sans'),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.5, 0.0, 0.0),
                                            child: Icon(
                                              Icons.chevron_right_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              StreamBuilder<List<TemplatesRecord>>(
                                stream: queryTemplatesRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<TemplatesRecord>
                                      templateScrollEditTemplatesRecordList =
                                      snapshot.data!;

                                  return wrapWithModel(
                                    model: _model.templateScrollEditModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TemplateScrollEditWidget(
                                      templates:
                                          templateScrollEditTemplatesRecordList,
                                    ),
                                  );
                                },
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: [
                            ChipData(FFLocalizations.of(context).getText(
                              'uqkustnd' /* TOP */,
                            )),
                            ChipData(FFLocalizations.of(context).getText(
                              'oj2oonbw' /* NEW */,
                            ))
                          ],
                          onChanged: (val) async {
                            safeSetState(() =>
                                _model.choiceChipsValue = val?.firstOrNull);
                            logFirebaseEvent(
                                'TEMPLATES_ChoiceChips_cp4cyv6w_ON_FORM_W');
                            logFirebaseEvent('ChoiceChips_haptic_feedback');
                            HapticFeedback.selectionClick();
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                  lineHeight: 1.3,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 4.0, 10.0, 4.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                  lineHeight: 1.3,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 4.0, 10.0, 4.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          chipSpacing: 6.0,
                          rowSpacing: 6.0,
                          multiselect: false,
                          initialized: _model.choiceChipsValue != null,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [
                              FFLocalizations.of(context).getText(
                                's1zax430' /* TOP */,
                              )
                            ],
                          ),
                          wrapped: true,
                        ),
                      ),
                      if ((_model.choiceChipsValue == 'NEW') &&
                          !_model.searchActive!)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: StreamBuilder<List<ImagesRecord>>(
                            stream: queryImagesRecord(
                              queryBuilder: (imagesRecord) => imagesRecord
                                  .where(
                                    'private',
                                    isEqualTo: false,
                                  )
                                  .orderBy('created', descending: true),
                              limit: 150,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ImagesRecord> newGalleryImagesRecordList =
                                  snapshot.data!;

                              return MasonryGridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0,
                                itemCount: newGalleryImagesRecordList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, newGalleryIndex) {
                                  final newGalleryImagesRecord =
                                      newGalleryImagesRecordList[
                                          newGalleryIndex];
                                  return DreamBrushImageWidget(
                                    key: Key(
                                        'Keyp6r_${newGalleryIndex}_of_${newGalleryImagesRecordList.length}'),
                                    imageRecord: newGalleryImagesRecord,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      if ((_model.choiceChipsValue == 'TOP') &&
                          !_model.searchActive!)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: StreamBuilder<List<ImagesRecord>>(
                            stream: queryImagesRecord(
                              queryBuilder: (imagesRecord) => imagesRecord
                                  .where(
                                    'private',
                                    isEqualTo: false,
                                  )
                                  .orderBy('likes', descending: true),
                              limit: 150,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ImagesRecord> topGalleryImagesRecordList =
                                  snapshot.data!;

                              return MasonryGridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0,
                                itemCount: topGalleryImagesRecordList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, topGalleryIndex) {
                                  final topGalleryImagesRecord =
                                      topGalleryImagesRecordList[
                                          topGalleryIndex];
                                  return DreamBrushImageWidget(
                                    key: Key(
                                        'Key53m_${topGalleryIndex}_of_${topGalleryImagesRecordList.length}'),
                                    imageRecord: topGalleryImagesRecord,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                    ].addToEnd(const SizedBox(height: 100.0)),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!(isWeb
                        ? MediaQuery.viewInsetsOf(context).bottom > 0
                        : _isKeyboardVisible))
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarWidget(
                            activePage: 4,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
