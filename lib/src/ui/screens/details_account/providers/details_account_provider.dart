import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

class DetailsAccountScreenProvider extends ChangeNotifier {
  AccountModel? _account;

  AccountModel? get account => _account;

  String _idArg = '';

  String get idArg => _idArg;

  void setData(AccountModel data) {
    _account = data;
    notifyListeners();
  }

  void setArg(String data) {
    _idArg = data;
    notifyListeners();
  }
}
