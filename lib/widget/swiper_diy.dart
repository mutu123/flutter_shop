import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperDiy extends StatelessWidget {

  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: ScreenUtil().setWidth(333),
      width: ScreenUtil().setHeight(750),
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            child: Image.network(
              swiperDataList[index]['image'], fit: BoxFit.fill,),
            borderRadius: BorderRadius.circular(5.0),
          );
        },
        autoplay: true,
        pagination: SwiperPagination(),
        viewportFraction: 0.85,
        scale: 0.88,
      ),
    );
  }
}




