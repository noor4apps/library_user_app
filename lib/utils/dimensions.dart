import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // dynamic height padding and margin
  static double height5 = screenHeight / 156;
  static double height10 = screenHeight / 78;
  static double height15 = screenHeight / 52;
  static double height20 = screenHeight / 39;
  static double height30 = screenHeight / 26;
  static double height45 = screenHeight / 17.3;
  static double height85 = screenHeight / 10;

  // dynamic wight padding and margin
  static double width5 = screenWidth / 156;
  static double width10 = screenWidth / 78;
  static double width15 = screenWidth / 52;
  static double width20 = screenWidth / 39;
  static double width30 = screenWidth / 26;

  // font size
  static double font14 = screenHeight / 61;
  static double font16 = screenHeight / 51;
  static double font20 = screenHeight / 43;
  static double font24 = screenHeight / 36;
  static double font26 = screenHeight / 33;

  // icon size
  static double iconSize16 = screenHeight / 50;
  static double iconSize24 = screenHeight / 35;

  static double radius15 = screenHeight / 52;
  static double radius20 = screenHeight / 39;
  static double radius30 = screenHeight / 26;

  // ImageSlideShow
  static double imageSlideShowH = screenHeight / 4.5;
  static double textSlideShow = screenWidth / 2;
  static double topTextSlideShow = screenWidth / 30;
  static double leftTextSlideShow = screenWidth / 50;

  // splash screen dimensions
  static double splashImg = screenHeight / 3.38;
}