import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provider/count_dart.dart';

class ShopCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[one(), second()],
      ),
    );
  }
}

class one extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(builder: (context, child, counter) {
        return Text('${counter.count}');
      }),
    );
  }
}

class second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Provide.value<Counter>(context).increment();
        },
        child: Text('递增'),
      ),
    );
  }
}
