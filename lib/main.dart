import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page/index_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.pink),
        debugShowCheckedModeBanner: false,
        home: IndexPage(),
      ),
    );
  }
}
