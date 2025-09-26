import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'details_account_localization_delegate.dart';

class DVPDetailsAccountLocalizations {
  final Locale locale;
  static const LocalizationsDelegate<DVPDetailsAccountLocalizations> delegate =
      DVPDetailsAccountLocalizationsDelegate();
  Map<String, dynamic>? _localizedStrings;

  DVPDetailsAccountLocalizations(this.locale);

  static DVPDetailsAccountLocalizations? of(BuildContext context) =>
      Localizations.of<DVPDetailsAccountLocalizations>(
        context,
        DVPDetailsAccountLocalizations,
      );

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
      'assets/locale/details_account.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));

    return true;
  }

  Map<String, dynamic>? getJson() => _localizedStrings;
}
