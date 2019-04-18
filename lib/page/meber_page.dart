import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/count_dart.dart';
import 'package:provide/provide.dart';

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
    return Container(
      child: Center(
        child: Provide<Counter>(builder: (context, child, counter) {
          return Text('${counter.count}');
        }),
      ),
    );
  }
}
