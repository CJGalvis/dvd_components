import 'package:flutter/material.dart';

import '../../config/details_account_config.dart';

class DetailsAccountArgs {
  final Map<String, dynamic> modelUI;
  final DetailsAccountConfig config;
  final VoidCallback onCompleted;

  DetailsAccountArgs({
    required this.modelUI,
    required this.config,
    required this.onCompleted,
  });
}
