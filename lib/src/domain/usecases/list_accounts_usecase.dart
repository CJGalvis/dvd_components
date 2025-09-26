import 'package:dvp_components/dvp_components.dart';

class ListAccountsUseCase {
  final ListAccountsGateway _gateway;

  ListAccountsUseCase(this._gateway);

  Future<(ErrorItem?, List<AccountModel>?)> getAccounts() async =>
      await _gateway.getAccounts();
}
