import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/http_headers.dart';

class ShopCartPage extends StatefulWidget {
  _ShopCartPageState createState() => _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> {
  Future getHttp() async {
    try {
      Response response;
      Dio dio = Dio();
      dio.options.headers = HttpHeaders;
      response = await dio.get("https://time.geekbang.org/serv/v1/column/newAll");
      print('$response');
      return response.data;
    } catch (e) {
      return print(e);
    }
  }


  String _showText = "";

  void _jike() {
    print('开始向极客时间请求数据..................');
    getHttp().then((val) {
      setState(() {
        _showText = val['data'].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // SingleChildScrollView(
        // child: 
        Column(
          children: <Widget>[
            RaisedButton(
                child: Text('请求数据'),
                onPressed: _jike
            ),
            Text(_showText)
          ],
        ),
      // ),
    );
  }
}
