import 'package:flutter/material.dart';

import 'create_account_localization.dart';

class DVPCreateAccountLocalizationsDelegate
    extends LocalizationsDelegate<DVPCreateAccountLocalizations> {
  const DVPCreateAccountLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<DVPCreateAccountLocalizations> load(Locale locale) async {
    DVPCreateAccountLocalizations localizations =
        DVPCreateAccountLocalizations(locale);
    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(DVPCreateAccountLocalizationsDelegate old) => false;
}
