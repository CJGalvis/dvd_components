import 'package:dvp_components/src/domain/usecases/create_account_usecase.dart';

import '../domain/gateways/create_account_gateway.dart';

class CreateAccountConfig {
  final CreateAccountUseCase createAccountUseCase;
  final CreateAccountGateway _api;

  CreateAccountConfig(this._api)
      : createAccountUseCase = CreateAccountUseCase(_api);
}
