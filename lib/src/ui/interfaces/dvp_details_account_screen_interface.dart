import 'package:dvp_components/src/ui/screens/details_account/models/details_account_model_ui.dart';

import '../../../dvp_components.dart';

abstract class DVPDetailsAccountScreenInterface {
  void showLoading();
  void hideLoading();
  void setUi(DetailsAccountModelUI model);
  void showError(ErrorItem error);
  void showCompleted();
}
