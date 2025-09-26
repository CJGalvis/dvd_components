import 'package:dvp_components/src/domain/domain.dart';

import '../../../presenters/base_presenter.dart';
import '../../../ui.dart';
import '../providers/create_screen_provider.dart';

class CreateAccountPresenter implements BasePresenter {
  final DVPCreateAccountScreenInterface _interface;
  final CreateAccountScreenProvider provider;
  final CreateAccountArgs _args;

  CreateAccountPresenter(this._interface, this._args)
      : provider = CreateAccountScreenProvider();

  @override
  void getUi(Map<String, dynamic> language) {
    final model = CreateAccountMapper().fromMap(language);
    _interface.setUi(model);
  }

  Future<void> createUser() async {
    _interface.showLoading();

    final request = AccountModel(
      address: provider.addressList,
      birthday: provider.dateController.text,
      lastname: provider.lastnameController.text,
      name: provider.nameController.text,
    );

    final response =
        await _args.config.createAccountUseCase.createAccount(request);
    _interface.hideLoading();

    final ErrorItem? error = response.$1;
    final bool data = response.$2;

    if (error != null) {
      _interface.showError(error);
    }

    if (data) {
      _interface.showCompleted();
    }
  }

  Future<void> loadData() async {
    _interface.showLoading();
    final response = await _args.config.createAccountUseCase.loadDataForm();

    final ErrorItem? error = response.$1;
    final Map<String, dynamic>? data = response.$2;

    if (error != null) {
      _interface.showError(error);
    }

    if (data != null) {
      provider.setRegions(data['regions']);
      provider.setCities(data['cities']);
    }

    _interface.hideLoading();
  }
}
