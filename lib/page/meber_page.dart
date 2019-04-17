import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeberPage extends StatefulWidget {
  _MeberPageState createState() => _MeberPageState();
}

class _MeberPageState extends State<MeberPage> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    var _lsit = ListTile.divideTiles(tiles: widgets, context: context).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
//      body: ListView.builder(
//        itemCount: widgets.length,
//        physics: BouncingScrollPhysics(),
//        itemBuilder: (BuildContext context, int position) {
//          return getRow(position);
//        },
//      ),
      body: ListView(
        children: _lsit,
      ),
    );
  }

  Widget getRow(int i) {
    return InkWell(
      child: Container(
        height: 40,
        margin: EdgeInsets.only(left: 10.0, top: 10.0),
        child: ListTile(
          title: Text('$i'),
        ),
        color: Colors.grey,
      ),
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length + 1));
        });
      },
    );
  }
}
