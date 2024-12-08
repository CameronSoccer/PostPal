import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_page_model.dart';
export 'loading_page_model.dart';

class LoadingPageWidget extends StatefulWidget {
  const LoadingPageWidget({super.key});

  @override
  State<LoadingPageWidget> createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget>
    with TickerProviderStateMixin {
  late LoadingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoadingPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADING_LoadingPage_ON_INIT_STATE');
      logFirebaseEvent('LoadingPage_haptic_feedback');
      HapticFeedback.vibrate();
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 30000.0.ms,
            begin: 0.3,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 20000.0.ms,
            begin: const Offset(0.5, 0.5),
            end: const Offset(1.0, 1.0),
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 0.02,
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 4000.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: -0.04,
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 0.02,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            begin: const Offset(0.5, 0.5),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: Opacity(
                        opacity: 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image.asset(
                            'assets/images/black-and-white-wavy-chequered-aesthetic-pattern-wallpaper-mural-Plain-820x532.webp',
                            width: 300.0,
                            height: 350.0,
                            fit: BoxFit.cover,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15.0,
                    sigmaY: 15.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.54),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '0gii2dmc' /* Generating... */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation']!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
