import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'global_localizations.dart';

class GlobalLocalizationsDelegate extends LocalizationsDelegate<GlobalLocalizations> {
  static GlobalLocalizationsDelegate delegate = GlobalLocalizationsDelegate();

  GlobalLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<GlobalLocalizations> load(Locale locale) {
    return new SynchronousFuture<GlobalLocalizations>(
        new GlobalLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<GlobalLocalizations> old) {
    return false;
  }
}
