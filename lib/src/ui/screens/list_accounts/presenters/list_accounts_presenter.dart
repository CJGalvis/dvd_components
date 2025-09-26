import 'package:dvp_components/src/ui/presenters/base_presenter.dart';

import '../../../../../dvp_components.dart';
import '../mappers/list_accounts_mapper.dart';
import '../providers/list_accounts_provider.dart';

class ListAccountsPresenter extends BasePresenter {
  final DVPListAccountsScreenInterface _interface;
  final ListAccountsScreenProvider provider;
  final ListAccountsArgs _args;

  ListAccountsPresenter(this._interface, this._args)
      : provider = ListAccountsScreenProvider();

  @override
  void getUi(Map<String, dynamic> language) {
    final model = ListAccountsMapper().fromMap(language);
    _interface.setUi(model);
  }

  Future<void> loadData() async {
    _interface.showLoading();
    final response = await _args.config.confirmDataUseCase.getAccounts();
    final ErrorItem? error = response.$1;
    final List<AccountModel>? data = response.$2;

    if (error != null) {
      _interface.showError(error);
    }

    if (data != null) {
      provider.setData(data);
    }

    _interface.hideLoading();
  }
}
