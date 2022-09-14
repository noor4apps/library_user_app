import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';
import 'package:library_user_app/view/widget/image_banner.dart';
import 'package:library_user_app/view/widget/popup_menu_account.dart';

class OrdersPage extends StatelessWidget {
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
            ImageBanner(img: '8.jpg'),
            SizedBox(height: Dimensions.height10),
            // ListView horizontal
            buildOrderList(),
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
            )),
      ),
    );
  }

  Widget buildOrderList() {
    return Column(
      children:<Widget>[
        SizedBox(height: Dimensions.height10),
        Container(
          height: Get.height / 2,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildOrderCard(AppColors.checkout);
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

  Widget buildOrderCard(status) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: Get.width / 1.2,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Container(
              padding: EdgeInsets.only(bottom: Dimensions.height20, left: Dimensions.width15, right: Dimensions.width15),
              color: status,
              width: double.infinity,
              height: Get.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                  Container(
                    height: Dimensions.height30,
                    child: Align (
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.clear, size: Dimensions.iconSize24, color: AppColors.bg),
                          ),
                      ),
                  ),
                  Container(
                    height: Dimensions.height30,
                    child: Text('Qui cumque non quart qui.', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.bg)),
                  ),
                  Container(
                    height: Dimensions.height30,
                    child: Text('2020-09-07', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.bg)),
                  ),
                  Container(
                    height: Dimensions.height30,
                    child: Text('Checkout', style: TextStyle(fontSize: Dimensions.font24, color: AppColors.bg)),
                  ),
                  Container(
                    height: Dimensions.height30,
                    child: Text('2020-09-08', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.bg)),
                  ),
                  Container(
                    height: Dimensions.height30,
                    child: Text('Issue Incidunt vel rerum architecto', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.bg)),
                  ),
                ],
              ),
            ),
            //
          ],
        ),
      ),
    );
  }

}
