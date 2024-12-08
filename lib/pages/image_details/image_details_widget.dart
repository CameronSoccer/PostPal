import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/paywall/paywall_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:share_plus/share_plus.dart';
import 'image_details_model.dart';
export 'image_details_model.dart';

class ImageDetailsWidget extends StatefulWidget {
  const ImageDetailsWidget({
    super.key,
    required this.imageRef,
    bool? fromCreation,
  }) : fromCreation = fromCreation ?? false;

  final DocumentReference? imageRef;
  final bool fromCreation;

  @override
  State<ImageDetailsWidget> createState() => _ImageDetailsWidgetState();
}

class _ImageDetailsWidgetState extends State<ImageDetailsWidget>
    with TickerProviderStateMixin {
  late ImageDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ImageDetails'});
    animationsMap.addAll({
      'toggleIconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.2, 1.2),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ImagesRecord>(
      stream: ImagesRecord.getDocument(widget.imageRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final imageDetailsImagesRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              iconTheme: IconThemeData(
                  color: FlutterFlowTheme.of(context).primaryText),
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'IMAGE_DETAILS_arrow_back_outlined_ICN_ON');
                    if (widget.fromCreation) {
                      logFirebaseEvent('IconButton_navigate_to');

                      context.goNamed(
                        'Schedule',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    } else {
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    }
                  },
                ),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '6hi0hxz1' /* Post  */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleLargeFamily,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleLargeFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.delete_outline,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'IMAGE_DETAILS_delete_outline_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_backend_call');
                          await imageDetailsImagesRecord.reference.delete();
                          if (widget.fromCreation) {
                            logFirebaseEvent('IconButton_navigate_to');

                            context.goNamed(
                              'Schedule',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.leftToRight,
                                ),
                              },
                            );
                          } else {
                            logFirebaseEvent('IconButton_navigate_back');
                            context.safePop();
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.download_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'IMAGE_DETAILS_download_outlined_ICN_ON_T');
                          logFirebaseEvent('IconButton_launch_u_r_l');
                          await launchURL(functions.imagePathToString(
                              imageDetailsImagesRecord.publicUrl));
                        },
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.share_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'IMAGE_DETAILS_share_outlined_ICN_ON_TAP');
                              logFirebaseEvent(
                                  'IconButton_generate_current_page_link');
                              _model.currentPageLink =
                                  await generateCurrentPageLink(
                                context,
                                title: 'Check out my AI image on DreamBrush!',
                                imageUrl: imageDetailsImagesRecord.publicUrl,
                                description:
                                    'I created this image thanks to the DreamBrush app!',
                                forceRedirect: true,
                              );

                              logFirebaseEvent('IconButton_share');
                              await Share.share(
                                _model.currentPageLink,
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: StreamBuilder<UsersRecord>(
                          stream:
                              UsersRecord.getDocument(currentUserReference!),
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

                            final stackUsersRecord = snapshot.data!;

                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'IMAGE_DETAILS_PAGE_Image_e1bqcf9z_ON_TAP');
                                      logFirebaseEvent('Image_expand_image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: OctoImage(
                                              placeholderBuilder: (_) =>
                                                  SizedBox.expand(
                                                child: Image(
                                                  image: BlurHashImage(
                                                      imageDetailsImagesRecord
                                                          .blurhash),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              image: NetworkImage(
                                                imageDetailsImagesRecord
                                                                .publicUrl !=
                                                            ''
                                                    ? imageDetailsImagesRecord
                                                        .publicUrl
                                                    : imageDetailsImagesRecord
                                                        .tempUrl,
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: imageDetailsImagesRecord
                                                            .publicUrl !=
                                                        ''
                                                ? imageDetailsImagesRecord
                                                    .publicUrl
                                                : imageDetailsImagesRecord
                                                    .tempUrl,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: imageDetailsImagesRecord
                                                      .publicUrl !=
                                                  ''
                                          ? imageDetailsImagesRecord.publicUrl
                                          : imageDetailsImagesRecord.tempUrl,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: OctoImage(
                                          placeholderBuilder: (_) =>
                                              SizedBox.expand(
                                            child: Image(
                                              image: BlurHashImage(
                                                  imageDetailsImagesRecord
                                                      .blurhash),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          image: NetworkImage(
                                            imageDetailsImagesRecord
                                                            .publicUrl !=
                                                        ''
                                                ? imageDetailsImagesRecord
                                                    .publicUrl
                                                : imageDetailsImagesRecord
                                                    .tempUrl,
                                          ),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.87,
                                          height: () {
                                            if (imageDetailsImagesRecord
                                                    .ratio ==
                                                '1024x1024') {
                                              return 300.0;
                                            } else if (imageDetailsImagesRecord
                                                    .ratio ==
                                                '1024x1792') {
                                              return 380.0;
                                            } else {
                                              return 220.0;
                                            }
                                          }(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 16.0, 0.0),
                                    child: ToggleIcon(
                                      onPressed: () async {
                                        final likedImagesElement =
                                            widget.imageRef;
                                        final likedImagesUpdate =
                                            stackUsersRecord.likedImages
                                                    .contains(
                                                        likedImagesElement)
                                                ? FieldValue.arrayRemove(
                                                    [likedImagesElement])
                                                : FieldValue.arrayUnion(
                                                    [likedImagesElement]);
                                        await stackUsersRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'likedImages': likedImagesUpdate,
                                            },
                                          ),
                                        });
                                      },
                                      value: stackUsersRecord.likedImages
                                          .contains(widget.imageRef),
                                      onIcon: Icon(
                                        Icons.favorite_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 36.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.favorite_border_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 36.0,
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'toggleIconOnActionTriggerAnimation']!,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: ClipRect(
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: 5.0,
                                    sigmaY: 5.0,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'g0itxlso' /* User Prompt */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              imageDetailsImagesRecord
                                                  .userPrompt,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 4.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zqa8rtv3' /* Revised Prompt */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              imageDetailsImagesRecord
                                                  .revisedPrompt,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 4.0)),
                                        ),
                                      ].divide(const SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'IMAGE_DETAILS_Container_tq4hheyz_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: const PaywallWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.auto_awesome_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 16.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'md5i0df1' /* Upgrade to View Public Prompts... */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            'Plus Jakarta Sans'),
                                                    lineHeight: 1.0,
                                                  ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (imageDetailsImagesRecord.category != '')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'pdn0c2f4' /* Style */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Text(
                              imageDetailsImagesRecord.category,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(height: 4.0)),
                        ),
                      ),
                    if (imageDetailsImagesRecord.userRef ==
                        currentUserReference)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'pdtogd2t' /* Album */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??=
                                        (currentUserDocument?.albums
                                                    .toList() ??
                                                [])
                                            .where((e) =>
                                                e.albumRef ==
                                                imageDetailsImagesRecord
                                                    .albumRef)
                                            .toList()
                                            .first
                                            .albumRef
                                            ?.id,
                                  ),
                                  options: List<String>.from(
                                      (currentUserDocument?.albums.toList() ??
                                              [])
                                          .map((e) => e.albumRef?.id)
                                          .withoutNulls
                                          .toList()),
                                  optionLabels:
                                      (currentUserDocument?.albums.toList() ??
                                              [])
                                          .map((e) => e.name)
                                          .toList(),
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dropDownValue = val);
                                    logFirebaseEvent(
                                        'IMAGE_DETAILS_DropDown_onx813ld_ON_FORM_');
                                    logFirebaseEvent('DropDown_backend_call');

                                    await widget.imageRef!
                                        .update(createImagesRecordData(
                                      albumRef: functions.stringToDocRef(
                                          _model.dropDownValue!),
                                    ));
                                  },
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'akmfla13' /* Select album... */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                      ),
                  ]
                      .divide(const SizedBox(height: 12.0))
                      .addToStart(const SizedBox(height: 24.0))
                      .addToEnd(const SizedBox(height: 32.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
