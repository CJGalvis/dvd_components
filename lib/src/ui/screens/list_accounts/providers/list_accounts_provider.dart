import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

class ListAccountsScreenProvider extends ChangeNotifier {
  List<AccountModel> _listAccounts = [];
  List<AccountModel> get listAccounts => List.unmodifiable(_listAccounts);

  void setData(List<AccountModel> data) {
    _listAccounts = data;
    notifyListeners();
  }
}
