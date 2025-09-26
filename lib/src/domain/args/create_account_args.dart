import 'package:dvp_components/src/config/create_account_config.dart';
import 'package:flutter/material.dart';

class CreateAccountArgs {
  final Map<String, dynamic> modelUI;
  final CreateAccountConfig config;
  final VoidCallback onCompleted;

  CreateAccountArgs({
    required this.modelUI,
    required this.config,
    required this.onCompleted,
  });
}
