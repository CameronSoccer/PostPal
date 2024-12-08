import '/auth/firebase_auth/auth_util.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/paywall/paywall_widget.dart';
import '/components/paywall_confirmation/paywall_confirmation_widget.dart';
import '/components/review/review_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loaded_tweets_model.dart';
export 'loaded_tweets_model.dart';

class LoadedTweetsWidget extends StatefulWidget {
  const LoadedTweetsWidget({
    super.key,
    required this.screenname,
  });

  final dynamic screenname;

  @override
  State<LoadedTweetsWidget> createState() => _LoadedTweetsWidgetState();
}

class _LoadedTweetsWidgetState extends State<LoadedTweetsWidget> {
  late LoadedTweetsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadedTweetsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LoadedTweets'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADED_TWEETS_LoadedTweets_ON_INIT_STATE');
      if (!functions.checkGreetingTime(FFAppState().lastGreetingTime!)) {
        logFirebaseEvent('LoadedTweets_update_app_state');
        FFAppState().greeting = functions.randomDailyGreeting(
            valueOrDefault(currentUserDocument?.firstName, ''));
        FFAppState().lastGreetingTime = getCurrentTimestamp;
        safeSetState(() {});
      }
      if (random_data.randomInteger(0, 10) == 5) {
        logFirebaseEvent('LoadedTweets_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: const ReviewWidget(),
              ),
            );
          },
        );
      }
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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'LOADED_TWEETS_PAGE_Icon_hzjwij5u_ON_TAP');
                          logFirebaseEvent('Icon_navigate_back');
                          context.safePop();
                        },
                        child: Icon(
                          Icons.arrow_circle_left_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
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
                            'LOADED_TWEETS_PAGE_Text_qmu5uffx_ON_TAP');
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
                          'gysxzc8p' /* PostPal */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                    ),
                  ],
                ),
              ],
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
                                    'LOADED_TWEETS_Container_tjkycxh0_ON_TAP');
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
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
                                          '4scrb1bf' /* UPGRADE */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
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
                                    'LOADED_TWEETS_Container_ndpmxrf5_ON_TAP');
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
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
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 16.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'nfj66i7d' /* PRO */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
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
                              'LOADED_TWEETS_Container_kdt32w34_ON_TAP');
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SizedBox(
            height: 11500.0,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 1.0),
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  widget.screenname,
                                  r'''$.user.name''',
                                ).toString(),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'c8g3ymtf' /* Tweets */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyLargeFamily),
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Builder(
                                        builder: (context) {
                                          final tweets = getJsonField(
                                            widget.screenname,
                                            r'''$.timeline''',
                                          ).toList();

                                          return RefreshIndicator(
                                            onRefresh: () async {},
                                            child: GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 1.0,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount: tweets.length,
                                              itemBuilder:
                                                  (context, tweetsIndex) {
                                                final tweetsItem =
                                                    tweets[tweetsIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'LOADED_TWEETS_Container_domq9jpo_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Container_haptic_feedback');
                                                    HapticFeedback
                                                        .lightImpact();
                                                    logFirebaseEvent(
                                                        'Container_navigate_to');

                                                    context.pushNamed(
                                                      'PostGen',
                                                      queryParameters: {
                                                        'tweetinfo':
                                                            serializeParam(
                                                          tweetsItem,
                                                          ParamType.JSON,
                                                        ),
                                                        'screenname':
                                                            serializeParam(
                                                          widget.screenname,
                                                          ParamType.JSON,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .bottomToTop,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  200),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 126.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            tweetsItem,
                                                            r'''$.text''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            tweetsItem,
                                                            r'''$.created_at''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            tweetsItem,
                                                            r'''$.media''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ]
                            .divide(const SizedBox(height: 12.0))
                            .addToEnd(const SizedBox(height: 110.0)),
                      ),
                    ),
                  ],
                ),
                wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavbarWidget(
                    activePage: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
