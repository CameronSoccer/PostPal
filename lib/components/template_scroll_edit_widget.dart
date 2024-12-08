import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'template_scroll_edit_model.dart';
export 'template_scroll_edit_model.dart';

class TemplateScrollEditWidget extends StatefulWidget {
  const TemplateScrollEditWidget({
    super.key,
    this.templates,
  });

  final List<TemplatesRecord>? templates;

  @override
  State<TemplateScrollEditWidget> createState() =>
      _TemplateScrollEditWidgetState();
}

class _TemplateScrollEditWidgetState extends State<TemplateScrollEditWidget> {
  late TemplateScrollEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemplateScrollEditModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final list = widget.templates?.map((e) => e).toList().toList() ?? [];

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(list.length, (listIndex) {
              final listItem = list[listIndex];
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'TEMPLATE_SCROLL_EDIT_Container_s36coifb_');
                    logFirebaseEvent('Container_haptic_feedback');
                    HapticFeedback.lightImpact();
                    logFirebaseEvent('Container_navigate_to');

                    context.pushNamed(
                      'EditTemplate',
                      queryParameters: {
                        'templateref': serializeParam(
                          listItem,
                          ParamType.Document,
                        ),
                        'templat': serializeParam(
                          listItem.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'templateref': listItem,
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 110.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: listItem.backgroundFile != ''
                                  ? Colors.transparent
                                  : listItem.color,
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 0),
                                fadeOutDuration: const Duration(milliseconds: 0),
                                imageUrl: listItem.backgroundFile,
                                width: 100.0,
                                height: listItem.size == '1024x1920'
                                    ? 187.5
                                    : 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 6.0),
                            child: Text(
                              listItem.name,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
                .divide(const SizedBox(width: 12.0))
                .addToStart(const SizedBox(width: 16.0))
                .addToEnd(const SizedBox(width: 16.0)),
          ),
        );
      },
    );
  }
}
