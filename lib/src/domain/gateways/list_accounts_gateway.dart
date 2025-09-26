import 'package:dvp_components/dvp_components.dart';

abstract class ListAccountsGateway {
  Future<(ErrorItem?, List<AccountModel>?)> getAccounts();
}
