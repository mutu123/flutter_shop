import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CataLoguePage extends StatefulWidget {
  _CataLogueState createState() => _CataLogueState();
}

class _CataLogueState extends State<CataLoguePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Text('分类'),
      ),
    );
  }
}