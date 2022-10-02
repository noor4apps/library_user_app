import 'package:library_user_app/app/Model/order_model.dart';

class OrderResponse {
  List<OrderModel>? orderList;
  int? error;
  String? message;

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      orderList = [];
      json['data'].forEach((e) {
        orderList!.add(OrderModel.fromJson(e));
      });
    }
    error = json['error'];
    message = json['message'];
  }
}
