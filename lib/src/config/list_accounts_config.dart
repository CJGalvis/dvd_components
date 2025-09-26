import 'package:dvp_components/src/domain/domain.dart';


class ListAccountsConfig {
  final ListAccountsUseCase confirmDataUseCase;
  final ListAccountsGateway _api;

  ListAccountsConfig(this._api)
      : confirmDataUseCase = ListAccountsUseCase(_api);
}
