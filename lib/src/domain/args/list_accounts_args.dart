import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

class ListAccountsArgs {
  final Map<String, dynamic> modelUI;
  final ListAccountsConfig config;
  final ValueChanged<AccountModel> onSelectItem;
  final VoidCallback onPressedFloatingButton;

  ListAccountsArgs({
    required this.modelUI,
    required this.config,
    required this.onSelectItem,
    required this.onPressedFloatingButton,
  });
}
