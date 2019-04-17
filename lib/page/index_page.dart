import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'catalogue.dart';
import 'home_page.dart';
import 'meber_page.dart';
import 'shop_cart_page.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('catalogue')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('cart')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.music_note), title: Text('member')),
  ];

  List<Widget> tabBodies = [
    HomePage(),
    CataLoguePage(),
    ShopCartPage(),
    MeberPage()
  ];

  int currentIndex = 0;
  var currentPage;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = tabBodies [currentIndex];
    _pageController = PageController()
      ..addListener(() {
        if (currentPage != _pageController.page.round()) {
          setState(() {
            currentPage = _pageController.page.round();
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies [currentIndex];
          });
        },
      ),
//      body: pageList[_currentIndex],
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}
