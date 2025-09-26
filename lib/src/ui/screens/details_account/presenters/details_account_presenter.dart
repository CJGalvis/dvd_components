import 'package:dvp_components/src/ui/presenters/base_presenter.dart';
import 'package:dvp_components/src/ui/screens/details_account/providers/details_account_provider.dart';

import '../../../../../dvp_components.dart';
import '../../../interfaces/dvp_details_account_screen_interface.dart';
import '../mappers/details_account_mapper.dart';

class DetailsAccountPresenter extends BasePresenter {
  final DVPDetailsAccountScreenInterface _interface;
  final DetailsAccountScreenProvider provider;
  final DetailsAccountArgs _args;

  DetailsAccountPresenter(this._interface, this._args)
      : provider = DetailsAccountScreenProvider();

  @override
  void getUi(Map<String, dynamic> language) {
    final model = ListAccountsMapper().fromMap(language);
    _interface.setUi(model);
  }

  Future<void> loadData() async {
    _interface.showLoading();
    final response =
        await _args.config.confirmDataUseCase.loadData(provider.idArg);
    final ErrorItem? error = response.$1;
    final AccountModel? data = response.$2;

    if (error != null) {
      _interface.showError(error);
    }

    if (data != null) {
      provider.setData(data);
    }

    _interface.hideLoading();
  }
}
