import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/app/Controller/client_order_controller.dart';
import 'package:library_user_app/app/Model/order_model.dart';
import 'package:library_user_app/helper/route_helper.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';
import 'package:library_user_app/view/widget/image_banner.dart';
import 'package:library_user_app/view/widget/no_data.dart';
import 'package:library_user_app/view/widget/popup_menu_account.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<ClientOrderController>().getClientOrderList();

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
        GetBuilder<ClientOrderController>(builder: (clientOrder) {
          return clientOrder.isLoading
              ?
          clientOrder.clientOrderList.length > 0
              ?
          Container(
            height: Get.height / 2,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildOrderCard(index, clientOrder.clientOrderList[index], clientOrder);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: Dimensions.width10);
              },
              itemCount: clientOrder.clientOrderList.length,
            ),
          )
              :
          NoData(text: 'There are no orders!')
              :
          CircularProgressIndicator(color: AppColors.textPrimary);
        }),
      ],
    );
  }

  Widget buildOrderCard(int index, OrderModel orderModel, _clientOrder) {
    var status = orderModel.status;
    return Container(
      width: Get.width / 1.2,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Container(
            padding: EdgeInsets.only(bottom: Dimensions.height20, left: Dimensions.width15, right: Dimensions.width15),
            color: status == 'submitting' ? AppColors.submitting : status == 'checkout' ? AppColors.checkout : AppColors.returned,
            width: double.infinity,
            height: Get.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget>[

                // clear order
                status == 'submitting' ?
                Container(
                  height: Dimensions.height15,
                  child: Align (
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        _clientOrder.destroyOrder(orderModel.id!);
                      },
                      icon: Icon(Icons.clear, size: Dimensions.iconSize24, color: AppColors.bg),
                    ),
                  ),
                ):Container(height: Dimensions.height15),

                // book name
                Container(
                  height: Dimensions.height45 + 5,
                  child: Text('${orderModel.books}', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.bg)),
                ),

                // checkout date
                orderModel.checkout != null ?
                Container(
                  height: Dimensions.height30,
                  child: Text('${orderModel.checkout}', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.bg)),
                ):Container(height: Dimensions.height30),

                // status
                Container(
                  height: Dimensions.height30,
                  child: Text(status!, style: TextStyle(fontSize: Dimensions.font24, color: AppColors.bg)),
                ),

                // returned date
                orderModel.returned != null ?
                Container(
                  height: Dimensions.height30,
                  child: Text('${orderModel.returned}', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.bg)),
                ):Container(height: Dimensions.height30),

                // issue
                orderModel.issue != null ?
                Container(
                  height: Dimensions.height30,
                  child: Text('${orderModel.issue}', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.bg)),
                ):Container(height: Dimensions.height30)

              ],
            ),
          ),
          //
        ],
      ),
    );
  }

}
