import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/app/Controller/auth_controller.dart';
import 'package:library_user_app/app/Controller/client_order_controller.dart';
import 'package:library_user_app/app/Controller/client_paginate_controller.dart';
import 'package:library_user_app/app/Model/book_model.dart';
import 'package:library_user_app/helper/route_helper.dart';
import 'package:library_user_app/utils/app_constants.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        GetBuilder<ClientPaginateController>(builder: (clientPaginate) {
          return clientPaginate.isLoading ?
          Container(
            height: Get.height / 1.8,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              itemBuilder: (context, index) {
                int halfIndex = clientPaginate.clientPaginateList.length ~/ 2;
                int index2 = halfIndex + index;
                return Column(
                  children: [
                    buildBookCard(index: index, bookModel: clientPaginate.clientPaginateList[index]),
                    SizedBox(height: 10),
                    buildBookCard(index: index2,bookModel: clientPaginate.clientPaginateList[index2])
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              itemCount: clientPaginate.clientPaginateList.length ~/ 2,
            ),
          ) : CircularProgressIndicator(color: AppColors.textPrimary);
        })
      ],
    );
  }

  Widget buildBookCard({required int index, required BookModel bookModel}) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.getBook(bookModel.id));
      },
      child: Container(
        width: Get.width - 40,
        height: Get.height / 3.7,
        child: Row(
          children: [
            Container(
              width: Get.width / 3,
              height: double.infinity,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Center(child: CircularProgressIndicator()),
                  Image.network('${AppConstants.BASE_URL}/storage/${bookModel.cover}', fit: BoxFit.fill, width: double.infinity, height: double.infinity),
                ],
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('${bookModel.title}', style: TextStyle(fontSize: Dimensions.font16, color: AppColors.textPrimary, fontWeight: FontWeight.bold), maxLines: 3, overflow: TextOverflow.ellipsis,)),
                  Row(
                    children: [
                      Expanded(child: Text('ISBN:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold))),
                      Text('${bookModel.isbn}', style: TextStyle(fontSize: Dimensions.font14, height: 1.3, color: AppColors.textPrimary))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Edition:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold))),
                      Text('${bookModel.edition}', style: TextStyle(fontSize: Dimensions.font14, height: 1.3, color: AppColors.textPrimary))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Volume:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold))),
                      Text('${bookModel.volume}', style: TextStyle(fontSize: Dimensions.font14, height: 1.3, color: AppColors.textPrimary))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Quantity:', style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold))),
                      Text('${bookModel.quantity}', style: TextStyle(fontSize: Dimensions.font14, height: 1.3, color: AppColors.textPrimary))
                    ],
                  ),
                  bookModel.is_pdf != true ?
                  IconButton(
                    onPressed: () {
                      if(Get.find<AuthController>().isUserLoggedIn()) {
                        Get.find<ClientOrderController>().addOrder(bookModel.id);
                      } else {
                        Get.toNamed(RouteHelper.getLogin());
                      }
                    },
                    icon: Icon(Icons.favorite_border),
                  )
                      :
                  IconButton(
                      onPressed: () {
                        Get.find<ClientOrderController>().launchURL(url: bookModel.url.toString());
                      },
                      icon: Icon(Icons.cloud_download_outlined)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
