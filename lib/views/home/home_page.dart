import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';
import 'package:library_user_app/views/Widgets/app_title.dart';
import 'package:library_user_app/views/home/popup_menu_account.dart';
import 'package:library_user_app/views/home/image_slide.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // logo
          leading: Builder(
            builder: (BuildContext context) {
              return Image(image: AssetImage('assets/image/icons/logo.png'));
            },
          ),
          actions: <Widget>[
            // PopupMenuAccount
            PopupMenuAccount(),
            // Mean Menu
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
      body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ImageSlideshow
              ImageSlide(),
              SizedBox(height: Dimensions.height10),
              // Title and paragraph Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTitle('NEW', 'BOOKS'),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.height10),
                child: Text(
                  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered lebmid alteration in some ledmid form',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Dimensions.iconSize16, color: AppColors.textPrimary),
                ),
              ),
              // ListView horizontal
              buildBookList(),
            ],
          ),
        ),
      bottomNavigationBar: Material(
        child: Container(
          padding: EdgeInsets.all(Dimensions.width5),
          color: AppColors.footer,
          height: Dimensions.height85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('There are many variations of passages of Lorem Ipsum available', style: TextStyle(fontSize: Dimensions.font14, color: AppColors.textPrimary), overflow: TextOverflow.ellipsis, maxLines: 1)
            ],
          )
        ),
      ),
    );
  }

  Widget buildBookList() {
    return Column(
      children:<Widget>[
        SizedBox(height: Dimensions.height10),
        Container(
          height: Get.height / 2.6,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildBookCard();
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: Dimensions.width10);
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }

  Widget buildBookCard() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: double.infinity,
        width: Get.width / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Container(
              width: double.infinity,
              height: Get.height / 4,
              child: Stack(
                children:<Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  Image.asset('assets/image/ph-lg.jpg', fit: BoxFit.fill, width: double.infinity, height: double.infinity),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height5),
            Text('Lorem Ipso available alteration', style: TextStyle(fontSize: Dimensions.font16, color: AppColors.textPrimary), overflow: TextOverflow.ellipsis, maxLines: 1),
            SizedBox(height: Dimensions.height5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.star, color: AppColors.iconPrimary, size: Dimensions.iconSize16),
                Icon(Icons.star, color: AppColors.iconPrimary, size: Dimensions.iconSize16),
                Icon(Icons.star, color: AppColors.iconPrimary, size: Dimensions.iconSize16),
                Icon(Icons.star_border, color: AppColors.iconPrimary, size: Dimensions.iconSize16),
                Icon(Icons.star_border, color: AppColors.iconPrimary, size: Dimensions.iconSize16),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
          ],
        ),
      ),
    );
  }

}
