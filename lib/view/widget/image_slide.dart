import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:library_user_app/helper/route_helper.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';
import 'package:library_user_app/view/widget/app_title.dart';

class ImageSlide extends StatelessWidget {
  const ImageSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: Colors.brown,
      onPageChanged: (value) {
      },
      autoPlayInterval: 3000,
      isLoop: false,
      children: [
        Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              width: Dimensions.screenWidth,
              height: Dimensions.imageSlideShowH,
              child: Image.asset('assets/image/bg/1.jpg', fit: BoxFit.fill, width: double.infinity, height: double.infinity),
            ),
            Positioned(
              top: Dimensions.height20,
              left: Dimensions.height10,
              width: Dimensions.textSlideShow,
              height: Dimensions.textSlideShow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle('Borrow', 'Your'),
                  AppTitle('favorite', 'Book'),
                  AppTitle('from', 'Here'),
                  TextButton(onPressed: () {
                    Get.toNamed(RouteHelper.getPaginate());
                  }, child: Text('choose now  --->', style: TextStyle(color: AppColors.textPrimary)))
                ],
              ),
            ),          ],
        ),
        Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              width: Dimensions.screenWidth,
              height: Dimensions.imageSlideShowH,
              child: Image.asset('assets/image/bg/7.jpg', fit: BoxFit.fill, width: double.infinity, height: double.infinity),
            ),
            Positioned(
              top: Dimensions.height20,
              left: Dimensions.height10,
              width: Dimensions.textSlideShow,
              height: Dimensions.textSlideShow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle('Borrow', 'Your'),
                  AppTitle('favorite', 'Book'),
                  AppTitle('from', 'Here'),
                  TextButton(onPressed: () {
                    Get.toNamed(RouteHelper.getPaginate());
                  }, child: Text('choose now  --->', style: TextStyle(color: AppColors.textPrimary)))
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
