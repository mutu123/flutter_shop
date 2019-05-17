import 'package:flutter/material.dart';

import 'strings/string_base.dart';
import 'strings/string_en.dart';
import 'strings/string_zh.dart';

class GlobalLocalizations {
  final Locale locale;

  GlobalLocalizations(this.locale);

  static Map<String, StringBase> _localizedValues = {
    'en': StringEn(),
    'zh': StringZh(),
  };

  StringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  static GlobalLocalizations of(BuildContext context) {
    return Localizations.of(context, GlobalLocalizations);
  }
}
