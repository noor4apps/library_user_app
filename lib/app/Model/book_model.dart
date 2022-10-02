class BookModel {
  late int id;
  late String title;
  late String isbn;
  String? quantity;
  late String edition;
  String? volume;
  String? issue;
  String? cover;
  bool? is_pdf;
  String? url;

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isbn = json['isbn'];
    quantity = json['quantity'];
    edition = json['edition'];
    volume = json['volume'];
    issue = json['issue'];
    cover = json['cover'];
    is_pdf = json['is_pdf'];
    url = json['url'];
  }
}
