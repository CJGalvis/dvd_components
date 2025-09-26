import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'list_accounts_localization_delegate.dart';

class DVPListAccountsLocalizations {
  final Locale locale;
  static const LocalizationsDelegate<DVPListAccountsLocalizations> delegate =
      DVPListAccountsLocalizationsDelegate();
  Map<String, dynamic>? _localizedStrings;

  DVPListAccountsLocalizations(this.locale);

  static DVPListAccountsLocalizations? of(BuildContext context) =>
      Localizations.of<DVPListAccountsLocalizations>(
        context,
        DVPListAccountsLocalizations,
      );

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
      'assets/locale/list_accounts.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));

    return true;
  }

  Map<String, dynamic>? getJson() => _localizedStrings;
}
