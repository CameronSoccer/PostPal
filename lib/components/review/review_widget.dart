import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'review_model.dart';
export 'review_model.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget>
    with TickerProviderStateMixin {
  late ReviewModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
      'iconOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
      'iconOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
      'iconOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
      'iconOnPageLoadAnimation6': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation7': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation8': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation9': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation10': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'dgicgm4a' /* Enjoying the app? */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('REVIEW_COMP_Text_m1t2m1kp_ON_TAP');
                    logFirebaseEvent('Text_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '5sg9a0kr' /* Tap to leave a review */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('REVIEW_COMP_Stack_qroh6u9q_ON_TAP');
                    logFirebaseEvent('Stack_haptic_feedback');
                    HapticFeedback.lightImpact();
                    logFirebaseEvent('Stack_close_dialog_drawer_etc');
                    Navigator.pop(context);
                    if (isiOS) {
                      logFirebaseEvent('Stack_launch_u_r_l');
                      await launchURL(
                          'itms-apps://itunes.apple.com/app/id/6471842626?action=write-review');
                    } else {
                      logFirebaseEvent('Stack_launch_u_r_l');
                      await launchURL(
                          'itms-apps://itunes.apple.com/app/id/6471842626?action=write-review');
                    }
                  },
                  child: Stack(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star_border,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation1']!),
                          Icon(
                            Icons.star_border,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation2']!),
                          Icon(
                            Icons.star_border,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation3']!),
                          Icon(
                            Icons.star_border,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation4']!),
                          Icon(
                            Icons.star_border,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation5']!),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation6']!),
                          Icon(
                            Icons.star_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation7']!),
                          Icon(
                            Icons.star_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation8']!),
                          Icon(
                            Icons.star_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation9']!),
                          Icon(
                            Icons.star_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 48.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation10']!),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('REVIEW_COMP_Text_vz6gy1rr_ON_TAP');
                    logFirebaseEvent('Text_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'sxcol3dy' /* I don't want to review */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
