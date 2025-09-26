
import '../domain/gateways/details_account_gateway.dart';
import '../domain/usecases/details_account_usecase.dart';

class DetailsAccountConfig {
  final DetailsAccountUseCase confirmDataUseCase;
  final DetailsAccountGateway _api;

  DetailsAccountConfig(this._api)
      : confirmDataUseCase = DetailsAccountUseCase(_api);
}
