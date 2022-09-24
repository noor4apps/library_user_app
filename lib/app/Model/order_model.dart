class Order {
  List<OrderModel>? orderList;
  int? error;
  String? message;

  Order({this.orderList, this.error, this.message});

  Order.fromJson(Map<String, dynamic> json) {
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

class OrderModel {
  int? id;
  String? checkout;
  String? status;
  String? returned;
  String? issue;
  String? books;

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    checkout = json['checkout'];
    status = json['status'];
    returned = json['returned'];
    issue = json['issue'];
    books = json['books'];
  }
}
