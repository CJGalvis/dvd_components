import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'create_account_localization_delegate.dart';

class DVPCreateAccountLocalizations {
  final Locale locale;
  static const LocalizationsDelegate<DVPCreateAccountLocalizations> delegate =
      DVPCreateAccountLocalizationsDelegate();
  Map<String, dynamic>? _localizedStrings;

  DVPCreateAccountLocalizations(this.locale);

  static DVPCreateAccountLocalizations? of(BuildContext context) =>
      Localizations.of<DVPCreateAccountLocalizations>(
        context,
        DVPCreateAccountLocalizations,
      );

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
      'assets/locale/create_account.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));

    return true;
  }

  Map<String, dynamic>? getJson() => _localizedStrings;
}
