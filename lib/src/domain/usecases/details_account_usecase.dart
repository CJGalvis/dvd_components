import 'package:dvp_components/dvp_components.dart';

import '../gateways/details_account_gateway.dart';

class DetailsAccountUseCase {
  final DetailsAccountGateway _gateway;

  DetailsAccountUseCase(this._gateway);

  Future<(ErrorItem?, AccountModel)> loadData(String id) async =>
      await _gateway.loadData(id);
}
