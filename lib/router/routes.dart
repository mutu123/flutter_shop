import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/router/router_handler.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static String homePage = '/home';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
    });

    router.define(detailsPage, handler: detailsHander);
    router.define(homePage, handler: homeHander);
  }
}
