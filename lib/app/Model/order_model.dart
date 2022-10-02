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
