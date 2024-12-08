import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_album_loading/add_album_loading_widget.dart';
import '/components/album_list_loading_component/album_list_loading_component_widget.dart';
import '/components/empty_gallery/empty_gallery_widget.dart';
import '/components/gallery_image_loading_component/gallery_image_loading_component_widget.dart';
import '/components/gallery_loading_component/gallery_loading_component_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/paywall/paywall_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'schedule_model.dart';
export 'schedule_model.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  late ScheduleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Schedule'});
  }

  @override
  void dispose() {
    _model.dispose();

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
          title: Text(
            FFLocalizations.of(context).getText(
              'g9plkvs3' /* Schedule */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleLargeFamily),
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
                                  'SCHEDULE_PAGE_Container_p96mmu78_ON_TAP');
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
                                        'm20ol7bs' /* UPGRADE */,
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
                                  'SCHEDULE_PAGE_Container_wxr6aqxp_ON_TAP');
                              logFirebaseEvent('Container_haptic_feedback');
                              HapticFeedback.lightImpact();
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
                                        '8qqxhf38' /* PRO */,
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
                            'SCHEDULE_PAGE_Container_248890et_ON_TAP');
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
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: StreamBuilder<List<AlbumsRecord>>(
                      stream: queryAlbumsRecord(
                        queryBuilder: (albumsRecord) => albumsRecord
                            .where(
                              'user_ref',
                              isEqualTo: currentUserReference,
                            )
                            .orderBy('created'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const AlbumListLoadingComponentWidget();
                        }
                        List<AlbumsRecord> gridViewAlbumsRecordList =
                            snapshot.data!;

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                            childAspectRatio: 1.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewAlbumsRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewAlbumsRecord =
                                gridViewAlbumsRecordList[gridViewIndex];
                            return StreamBuilder<List<ImagesRecord>>(
                              stream: queryImagesRecord(
                                queryBuilder: (imagesRecord) => imagesRecord
                                    .where(
                                      'album_ref',
                                      isEqualTo: gridViewAlbumsRecord.reference,
                                    )
                                    .orderBy('created', descending: true),
                                limit: 7,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const GalleryLoadingComponentWidget();
                                }
                                List<ImagesRecord> containerImagesRecordList =
                                    snapshot.data!;

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SCHEDULE_PAGE_Container_vh0o1oor_ON_TAP');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'IndividualAlbum',
                                      queryParameters: {
                                        'albumRef': serializeParam(
                                          gridViewAlbumsRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        if (containerImagesRecordList.isNotEmpty) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FutureBuilder<int>(
                                              future: queryImagesRecordCount(
                                                queryBuilder: (imagesRecord) =>
                                                    imagesRecord.where(
                                                  'album_ref',
                                                  isEqualTo:
                                                      gridViewAlbumsRecord
                                                          .reference,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return const GalleryImageLoadingComponentWidget();
                                                }
                                                int gridViewCount =
                                                    snapshot.data!;

                                                return GridView(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 8.0,
                                                    mainAxisSpacing: 8.0,
                                                    childAspectRatio: 1.0,
                                                  ),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    if (gridViewCount > 0)
                                                      Hero(
                                                        tag: containerImagesRecordList[
                                                                            0]
                                                                        .publicUrl !=
                                                                    ''
                                                            ? containerImagesRecordList[
                                                                    0]
                                                                .publicUrl
                                                            : containerImagesRecordList[
                                                                    0]
                                                                .tempUrl,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            containerImagesRecordList[0]
                                                                            .publicUrl !=
                                                                        ''
                                                                ? containerImagesRecordList[
                                                                        0]
                                                                    .publicUrl
                                                                : containerImagesRecordList[
                                                                        0]
                                                                    .tempUrl,
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    if (gridViewCount > 1)
                                                      Hero(
                                                        tag: containerImagesRecordList[
                                                                            1]
                                                                        .publicUrl !=
                                                                    ''
                                                            ? containerImagesRecordList[
                                                                    1]
                                                                .publicUrl
                                                            : containerImagesRecordList[
                                                                    1]
                                                                .tempUrl,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            containerImagesRecordList[1]
                                                                            .publicUrl !=
                                                                        ''
                                                                ? containerImagesRecordList[
                                                                        1]
                                                                    .publicUrl
                                                                : containerImagesRecordList[
                                                                        1]
                                                                    .tempUrl,
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    if (gridViewCount > 2)
                                                      Hero(
                                                        tag: containerImagesRecordList[
                                                                            2]
                                                                        .publicUrl !=
                                                                    ''
                                                            ? containerImagesRecordList[
                                                                    2]
                                                                .publicUrl
                                                            : containerImagesRecordList[
                                                                    2]
                                                                .tempUrl,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            containerImagesRecordList[2]
                                                                            .publicUrl !=
                                                                        ''
                                                                ? containerImagesRecordList[
                                                                        2]
                                                                    .publicUrl
                                                                : containerImagesRecordList[
                                                                        2]
                                                                    .tempUrl,
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    if (gridViewCount > 3)
                                                      Builder(
                                                        builder: (context) {
                                                          if (gridViewCount <=
                                                              1) {
                                                            return Hero(
                                                              tag: containerImagesRecordList[3]
                                                                              .publicUrl !=
                                                                          ''
                                                                  ? containerImagesRecordList[
                                                                          3]
                                                                      .publicUrl
                                                                  : containerImagesRecordList[
                                                                          3]
                                                                      .tempUrl,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  containerImagesRecordList[3].publicUrl !=
                                                                              ''
                                                                      ? containerImagesRecordList[
                                                                              3]
                                                                          .publicUrl
                                                                      : containerImagesRecordList[
                                                                              3]
                                                                          .tempUrl,
                                                                  width: 300.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return GridView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                crossAxisSpacing:
                                                                    4.0,
                                                                mainAxisSpacing:
                                                                    4.0,
                                                                childAspectRatio:
                                                                    1.0,
                                                              ),
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                if (gridViewCount >
                                                                    3)
                                                                  Hero(
                                                                    tag: containerImagesRecordList[3].publicUrl !=
                                                                                ''
                                                                        ? containerImagesRecordList[3]
                                                                            .publicUrl
                                                                        : containerImagesRecordList[3]
                                                                            .tempUrl,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0),
                                                                      child: Image
                                                                          .network(
                                                                        containerImagesRecordList[3].publicUrl != ''
                                                                            ? containerImagesRecordList[3].publicUrl
                                                                            : containerImagesRecordList[3].tempUrl,
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (gridViewCount >
                                                                    4)
                                                                  Hero(
                                                                    tag: containerImagesRecordList[4].publicUrl !=
                                                                                ''
                                                                        ? containerImagesRecordList[4]
                                                                            .publicUrl
                                                                        : containerImagesRecordList[4]
                                                                            .tempUrl,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0),
                                                                      child: Image
                                                                          .network(
                                                                        containerImagesRecordList[4].publicUrl != ''
                                                                            ? containerImagesRecordList[4].publicUrl
                                                                            : containerImagesRecordList[4].tempUrl,
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (gridViewCount >
                                                                    5)
                                                                  Hero(
                                                                    tag: containerImagesRecordList[5].publicUrl !=
                                                                                ''
                                                                        ? containerImagesRecordList[5]
                                                                            .publicUrl
                                                                        : containerImagesRecordList[5]
                                                                            .tempUrl,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0),
                                                                      child: Image
                                                                          .network(
                                                                        containerImagesRecordList[5].publicUrl != ''
                                                                            ? containerImagesRecordList[5].publicUrl
                                                                            : containerImagesRecordList[5].tempUrl,
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (gridViewCount >
                                                                    6)
                                                                  Hero(
                                                                    tag: containerImagesRecordList[6].publicUrl !=
                                                                                ''
                                                                        ? containerImagesRecordList[6]
                                                                            .publicUrl
                                                                        : containerImagesRecordList[6]
                                                                            .tempUrl,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0),
                                                                      child: Image
                                                                          .network(
                                                                        containerImagesRecordList[6].publicUrl != ''
                                                                            ? containerImagesRecordList[6].publicUrl
                                                                            : containerImagesRecordList[6].tempUrl,
                                                                        width:
                                                                            300.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            );
                                                          }
                                                        },
                                                      ),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return EmptyGalleryWidget(
                                            key: Key(
                                                'Keykyr_${gridViewIndex}_of_${gridViewAlbumsRecordList.length}'),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navbarModel,
                updateCallback: () => safeSetState(() {}),
                child: const NavbarWidget(
                  activePage: 3,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 120.0),
                child: FutureBuilder<int>(
                  future: queryAlbumsRecordCount(
                    queryBuilder: (albumsRecord) => albumsRecord.where(
                      'user_ref',
                      isEqualTo: currentUserReference,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const AddAlbumLoadingWidget();
                    }
                    int iconButtonCount = snapshot.data!;

                    return FlutterFlowIconButton(
                      borderRadius: 40.0,
                      buttonSize: 60.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).info,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('SCHEDULE_PAGE_add_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_haptic_feedback');
                        HapticFeedback.lightImpact();
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed('SchedulePost');
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
