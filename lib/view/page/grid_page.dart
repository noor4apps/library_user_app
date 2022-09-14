import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';
import 'package:library_user_app/view/widget/image_banner.dart';
import 'package:library_user_app/view/widget/popup_menu_account.dart';

class GridPage extends StatelessWidget {
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
          children: [
            // ImageSlideshow
            ImageBanner(img: '9.jpg'),
            SizedBox(height: Dimensions.height10),
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
        Container(
          height: Get.height / 1.8,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(10, (index) {
              return buildBookCard();
            }),
          )
        ),
      ],
    );
  }

  Widget buildBookCard() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              width: double.infinity,
              height: Get.height / 5.8,
              child: Stack(
                children:<Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  Image.asset('assets/image/ph-sm.jpg', fit: BoxFit.fill, width: double.infinity, height: double.infinity),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height5),
            Text('Lorem Ipso available alteration', style: TextStyle(fontSize: Dimensions.font16, color: AppColors.textPrimary), overflow: TextOverflow.ellipsis, maxLines: 1),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
          ],
        ),
      ),
    );
  }

}
