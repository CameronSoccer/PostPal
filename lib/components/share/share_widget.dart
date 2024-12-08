import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'share_model.dart';
export 'share_model.dart';

class ShareWidget extends StatefulWidget {
  const ShareWidget({super.key});

  @override
  State<ShareWidget> createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget>
    with TickerProviderStateMixin {
  late ShareModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareModel());

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1600.0.ms,
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
        width: 350.0,
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
                    '7fdgdouq' /* Share the app and get 2 FREE v... */,
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
                    logFirebaseEvent('SHARE_COMP_Text_vpaa1bvm_ON_TAP');
                    logFirebaseEvent('Text_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'al6asmtu' /* Tap to share the link with fri... */,
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
              Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('SHARE_COMP_Annual_ON_TAP');
                      logFirebaseEvent('Annual_haptic_feedback');
                      HapticFeedback.lightImpact();
                      logFirebaseEvent('Annual_close_dialog_drawer_etc');
                      Navigator.pop(context);
                      if (isiOS) {
                        logFirebaseEvent('Annual_share');
                        await Share.share(
                          'https://apps.apple.com/app/dreambrush-dream-to-design/id6471842626',
                          sharePositionOrigin: getWidgetBoundingBox(context),
                        );
                        logFirebaseEvent('Annual_update_app_state');
                        FFAppState().weeklyGenerations =
                            FFAppState().weeklyGenerations + 5;
                        safeSetState(() {});
                      } else {
                        logFirebaseEvent('Annual_share');
                        await Share.share(
                          'https://apps.apple.com/app/dreambrush-dream-to-design/id6471842626',
                          sharePositionOrigin: getWidgetBoundingBox(context),
                        );
                        logFirebaseEvent('Annual_update_app_state');
                        FFAppState().weeklyGenerations =
                            FFAppState().weeklyGenerations + 5;
                        safeSetState(() {});
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      '84420ad2' /* Share & Get 2 FREE videos */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['buttonOnPageLoadAnimation']!),
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
                    logFirebaseEvent('SHARE_COMP_Text_at4rs3ac_ON_TAP');
                    logFirebaseEvent('Text_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ec0kqq6r' /* I don't want to share */,
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
