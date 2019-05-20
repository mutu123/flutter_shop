import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/global_icons.dart';
import 'package:flutter_shop/config/theme_manager.dart';
import 'package:flutter_shop/provider/theme_provider.dart';
import 'package:flutter_shop/style/strings/strings.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeberPage extends StatefulWidget {
  _MeberPageState createState() => _MeberPageState();
}

class _MeberPageState extends State<MeberPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvide>(builder: (context, child, theme) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        appBar: AppBar(
          title: Text('个人中心'),
        ),
        body: Column(
          children: <Widget>[
            _topLoginWidget(theme),
            _bottomListWidget(),
          ],
        ),
      );
    });
  }

  Widget _topLoginWidget(ThemeProvide theme) {
    return Container(
      height: ScreenUtil().setHeight(450),
      color: theme.themeData.primaryColor,
      child: Align(
          child: ClipOval(
        child: SizedBox(
          width: ScreenUtil().setWidth(150),
          height: ScreenUtil().setHeight(150),
          child: FadeInImage.assetNetwork(
            placeholder: GlobalIcons.DEFAULT_USER_ICON,
            image: 'http://blogimages.jspang.com/blogtouxiang1.jpg',
            height: ScreenUtil().setHeight(200),
            fit: BoxFit.fill,
          ),
        ),
      )),
    );
  }

  Widget _bottomListWidget() {
    return Expanded(
        child: ListView(
      children: <Widget>[
        _warp(Icons.settings,'切换主题',_showThemeSelectDialog),
        _warp(Icons.language,'切换语言',_showLanguageDialog),
      ],
    ));
  }

  _warp(IconData icon,String text,Function() callBack){
    return  Container(
      decoration: BoxDecoration(
          border:
          Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      height: ScreenUtil().setHeight(120),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(5),child: Icon(icon),), Text(text),
          ],
        ),
        onTap: callBack,
      ),
    );
  }

  /**
   * 弹出切换主题框
   */
  _showThemeSelectDialog() {
    buildItem(Color color, String str) {
      return ListTile(
        leading: Container(
          width: 30.0,
          height: 30.0,
          color: color,
        ),
        title: Text(str),
        onTap: () async {
          Provide.value<ThemeProvide>(context).refreshTheme(ThemeData(primaryColor: color));
          Navigator.pop(context);
          }
      );
    }

    Map map = Map();
    map[ThemeDataManager.themeColorList[0]] = Strings.of(context).themeBlue();
    map[ThemeDataManager.themeColorList[1]] = Strings.of(context).themeGreen();
    map[ThemeDataManager.themeColorList[2]] = Strings.of(context).themeBrown();
    map[ThemeDataManager.themeColorList[3]] = Strings.of(context).themeRed();
    map[ThemeDataManager.themeColorList[4]] = Strings.of(context).themeAmber();
    map[ThemeDataManager.themeColorList[5]] = Strings.of(context).themeIndigo();
    map[ThemeDataManager.themeColorList[6]] = Strings.of(context).themeDark();

    List<Widget> children = List();
    map.forEach((key, value) {
      children.add(buildItem(key, value));
    });

    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(Strings.of(context).selectTheme()),
            children: children,
          );
        });
  }

  /**
   * 弹出切换语言框
   */
  _showLanguageDialog(){
    const String keyEnglish = 'english';
    const String keyChinese = 'chinese';

    dispatch(String lang){
      Locale _local;

      switch (lang) {
        case keyChinese:
          _local = Locale('zh', 'CH');
          break;
        case keyEnglish:
          _local = Locale('en', 'US');
          break;
      }

      Provide.value<ThemeProvide>(context).refreshLanguage(_local);
      Navigator.pop(context);
    }

    buildItem(String title){
      return ListTile(
        title: Text(title),
        onTap: (){
          dispatch(title);
        },
      );
    }

    Map map= Map();
    map[keyEnglish] = Strings.of(context).languageEn();
    map[keyChinese] = Strings.of(context).languageZh();

    List<Widget> children = List();
    map.forEach((key,value){
      children.add(buildItem(key));
    });

    showDialog(
        context: context,
        builder: (context){
      return SimpleDialog(
        title: Text(Strings.of(context).selectTheme()),
        children: children,);
    });
  }
}
