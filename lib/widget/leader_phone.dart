import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {

  final String leaderImage; //店长图片
  final String leaderPhone;

  LeaderPhone(@required this.leaderImage, @required this.leaderPhone); //店长电话

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:' + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}