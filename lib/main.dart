import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/app/Controller/client_paginate_controller.dart';
import 'package:library_user_app/view/page/grid_page.dart';
import 'package:library_user_app/helper/dependencies.dart' as dep;

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: GridPage(),
    );
  }
}
