import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';
import 'package:library_user_app/view/widget/image_banner.dart';
import 'package:library_user_app/view/widget/popup_menu_account.dart';

class BookPage extends StatelessWidget {
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
            ImageBanner(img: '2.jpg'),
            SizedBox(height: Dimensions.height10),
            // ListView horizontal
            buildBookCard(),
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

  Widget buildBookCard() {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.white60,
        height: Get.height / 1.8,
        // width: Get.width * 0.5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        height: Get.height / 2.8,
                        width: Get.width / 2.5,
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
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border, size: 48,))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width - Get.width / 2.5,
                        child: Text('Lorem Ipso available alteration Ipso available alteration Ipso available alteration 1', style: TextStyle(fontSize: Dimensions.font16, color: AppColors.textPrimary),
                        ),
                      ),
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
                      SizedBox(height: Dimensions.height10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 0.5,
                          width: Get.width - Get.width / 2,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: Dimensions.height5),
                      Row(
                        children: [
                          Container(width: Get.width - Get.width / 1.5, child: Text('ISBN:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold))),
                          Text('0656865059', style: TextStyle(fontSize: Dimensions.font14, height: 1.3, color: AppColors.textPrimary))
                        ],
                      ),
                      Row(
                        children: [
                          Container(width: Get.width - Get.width / 1.5, child: Text('Edition:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold))),
                          Text('V2', style: TextStyle(fontSize: Dimensions.font14, height: 1.3, color: AppColors.textPrimary))
                        ],
                      ),
                      Row(
                        children: [
                          Container(width: Get.width - Get.width / 1.5, child: Text('Volume:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold))),
                          Text('N1', style: TextStyle(fontSize: Dimensions.font14, height: 1.3, color: AppColors.textPrimary))
                        ],
                      ),
                      Row(
                        children: [
                          Container(width: Get.width - Get.width / 1.5, child: Text('Quantity:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold))),
                          Text('4', style: TextStyle(fontSize: Dimensions.font14, height: 1.3, color: AppColors.textPrimary))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Authors:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 1,
                      runSpacing: 1,
                      children: ['Mr. Merlin Dickens', 'Lazaro Gorczany DDS', 'Lazaro Gorczany DDS'].map((String n) => Chip(
                        label: Text(n),
                      ),
                      ).toList(),
                    ),
                    Text('Categories :', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold)),
                    Wrap(
                      spacing: 1,
                      runSpacing: 1,
                      children: ['Atque vel.', 'Pariatur laboriosam qui.', 'Ut labore.'].map((String n) => Chip(
                        avatar: CircleAvatar(child: Text(n.substring(0,1))),
                        label: Text(n),
                      ),
                      ).toList(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
