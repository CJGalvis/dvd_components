import 'package:flutter/material.dart';

import 'details_account_localization.dart';

class DVPDetailsAccountLocalizationsDelegate
    extends LocalizationsDelegate<DVPDetailsAccountLocalizations> {
  const DVPDetailsAccountLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<DVPDetailsAccountLocalizations> load(Locale locale) async {
    DVPDetailsAccountLocalizations localizations =
        DVPDetailsAccountLocalizations(locale);
    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(DVPDetailsAccountLocalizationsDelegate old) => false;
}
