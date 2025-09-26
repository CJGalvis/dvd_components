import 'package:dvp_components/dvp_components.dart';

abstract class DetailsAccountGateway {
  Future<(ErrorItem?, AccountModel)> loadData(String id);
}
