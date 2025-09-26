import 'package:flutter/material.dart';

import 'list_accounts_localization.dart';

class DVPListAccountsLocalizationsDelegate
    extends LocalizationsDelegate<DVPListAccountsLocalizations> {
  const DVPListAccountsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<DVPListAccountsLocalizations> load(Locale locale) async {
    DVPListAccountsLocalizations localizations =
        DVPListAccountsLocalizations(locale);
    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(DVPListAccountsLocalizationsDelegate old) => false;
}
