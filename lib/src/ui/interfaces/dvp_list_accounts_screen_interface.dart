import 'package:dvp_components/src/ui/screens/list_accounts/models/list_accounts_model_ui.dart';

import '../../../dvp_components.dart';

abstract class DVPListAccountsScreenInterface {
  void showLoading();
  void hideLoading();
  void setUi(ListAccountsModelUI model);
  void showError(ErrorItem error);
  void showCompleted();
}
