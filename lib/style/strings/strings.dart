import 'package:flutter/material.dart';

import '../global_localizations.dart';
import 'string_base.dart';

class Strings {
  static StringBase of(BuildContext context) {
    return GlobalLocalizations.of(context).currentLocalized;
  }
}
