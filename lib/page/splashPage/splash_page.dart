import 'package:flutter/material.dart';
import 'package:flutter_shop/config/global_icons.dart';
import 'package:flutter_shop/router/application.dart';
import 'package:flutter_shop/router/routes.dart';
import 'package:flutter_shop/style/strings/strings.dart';

import '../index_page.dart';

class SplashPage extends StatefulWidget {
  static final String name = '/splsh';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Image.asset(GlobalIcons.SPLASH_PAGE_1),
          Image.asset(GlobalIcons.SPLASH_PAGE_2),
          pageThree(),
        ],
      ),
    );
  }

  Widget pageThree() {
    return Stack(
      children: <Widget>[
        Image.asset(GlobalIcons.SPLASH_PAGE_3),
        Positioned(
           left: MediaQuery.of(context).size.width/2,
           bottom: 90,
            child: RaisedButton(
          onPressed: () {
//            Navigator.pushReplacementNamed(context,IndexPage.name);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>IndexPage()));
//            Navigator.pop(context);
          },
          child: Text(Strings.of(context).next()),
          color: Colors.pink,
        ))
      ],
    );
  }
}
