import '/components/premium_features_list/premium_features_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'paywall_confirmation_widget.dart' show PaywallConfirmationWidget;
import 'package:flutter/material.dart';

class PaywallConfirmationModel
    extends FlutterFlowModel<PaywallConfirmationWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for premiumFeaturesList component.
  late PremiumFeaturesListModel premiumFeaturesListModel;

  @override
  void initState(BuildContext context) {
    premiumFeaturesListModel =
        createModel(context, () => PremiumFeaturesListModel());
  }

  @override
  void dispose() {
    premiumFeaturesListModel.dispose();
  }
}
