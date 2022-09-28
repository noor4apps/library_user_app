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

class GridPage extends StatefulWidget {
  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  final clientPaginateController = Get.find<ClientPaginateController>();
  final scrollController = ScrollController();

  @override
  void initState() {
    clientPaginateController.getClientPaginateList();

    scrollController.addListener(() {
      var sControllerOffset = scrollController.offset;
      var sControllerMax = scrollController.position.maxScrollExtent - 100;
      var isLoadingPagination = clientPaginateController.isLoadingPagination;
      var hasMorePages = clientPaginateController.currentPage < clientPaginateController.lastPage;

      if (sControllerOffset > sControllerMax && isLoadingPagination == false && hasMorePages) {
        clientPaginateController.isLoadingPagination = true;
        clientPaginateController.currentPage++;

        clientPaginateController.getClientPaginateList(page: clientPaginateController.currentPage);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All books')),
      body: GetBuilder<ClientPaginateController>(builder: (clientPaginate) {
        return clientPaginate.isLoading
            ?
        CircularProgressIndicator(color: AppColors.textPrimary)
            :
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return buildBookCard(
                      index: index,
                      bookModel: clientPaginate.clientPaginateList[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: clientPaginate.clientPaginateList.length,
                ),
                Visibility(
                  visible: !clientPaginate.isLoadingPagination,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 40,
                    height: 40,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildBookCard({required int index, required BookModel bookModel}) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.getBook(bookModel.id));
      },
      child: Container(
        width: Get.width - 40,
        height: Get.height / 4,
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
