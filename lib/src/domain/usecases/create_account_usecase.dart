import 'package:dvp_components/dvp_components.dart';

class CreateAccountUseCase {
  final CreateAccountGateway _gateway;

  CreateAccountUseCase(this._gateway);

  Future<(ErrorItem?, bool)> createAccount(AccountModel user) async =>
      await _gateway.createAccount(user);

  Future<(ErrorItem?, Map<String, dynamic>)> loadDataForm() async =>
      await _gateway.loadDataForm();
}
