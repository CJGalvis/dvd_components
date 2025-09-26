import 'package:dvp_components/dvp_components.dart';

abstract class CreateAccountGateway {
  Future<(ErrorItem?, bool)> createAccount(AccountModel user);

  Future<(ErrorItem?, Map<String, dynamic>)> loadDataForm();
}
