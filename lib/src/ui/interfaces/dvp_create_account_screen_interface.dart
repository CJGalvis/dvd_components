import '../../../dvp_components.dart';

abstract class DVPCreateAccountScreenInterface {
  void showLoading();
  void hideLoading();
  void setUi(CreateAccountModelUI model);
  void showError(ErrorItem error);
  void showCompleted();
}
