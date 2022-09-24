import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/app/Controller/client_index_controller.dart';
import 'package:library_user_app/app/Controller/client_order_controller.dart';
import 'package:library_user_app/app/Controller/client_paginate_controller.dart';
import 'package:library_user_app/helper/route_helper.dart';
import 'package:library_user_app/view/page/grid_page.dart';
import 'package:library_user_app/helper/dependencies.dart' as dep;
import 'package:library_user_app/view/page/home_page.dart';
import 'package:library_user_app/view/page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ClientPaginateController>().getClientPaginateList();
    Get.find<ClientIndexController>().getClientIndexList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
