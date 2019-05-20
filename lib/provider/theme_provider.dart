import 'package:flutter/material.dart';

class ThemeProvide with ChangeNotifier {
  ThemeData themeData = ThemeData(primaryColor: Colors.pink);
  Locale locale = Locale('zh', 'CH');
  Locale platformLocale;

  /**
   * 切换主题
   */
  refreshTheme(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }

  /**
   * locale 切换语言
   */
  refreshLanguage(Locale locale){
    this.locale =locale;
    notifyListeners();
  }

/**
 * 是否进入引导页
 */
  setSplashState({bool isFirst}){

  }
}
