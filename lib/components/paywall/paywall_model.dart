import '/components/premium_features_list/premium_features_list_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'paywall_widget.dart' show PaywallWidget;
import 'package:flutter/material.dart';

class PaywallModel extends FlutterFlowModel<PaywallWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for premiumFeaturesList component.
  late PremiumFeaturesListModel premiumFeaturesListModel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 86399;
  int timerMilliseconds = 86399;
  String timerValue = StopWatchTimer.getDisplayTime(86399);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    premiumFeaturesListModel =
        createModel(context, () => PremiumFeaturesListModel());
  }

  @override
  void dispose() {
    premiumFeaturesListModel.dispose();
    timerController.dispose();
  }
}
