import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageBanner extends StatelessWidget {
  String img;

  ImageBanner({required String this.img, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height / 5,
      child: Stack(
        children:<Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          Image.asset('assets/image/bg/${img}', fit: BoxFit.fill, width: double.infinity, height: double.infinity),
        ],
      ),
    );
  }
}
