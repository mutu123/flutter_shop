import 'package:flutter/material.dart';

class AdBanner  extends StatelessWidget {
 final String advertesPicture;
 
 AdBanner(this.advertesPicture);

 @override
  Widget build(BuildContext context) {
    return
      Image.network(advertesPicture);
  }

}

