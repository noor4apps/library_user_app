class Book {
  List<BookModel>? _bookList;
  int? _error;
  String? _message;

  List<BookModel>? get bookList => _bookList;

  int? get error => _error;

  String? get message => _message;

  Book(this._bookList, this._error, this._message);

  Book.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _bookList = [];
      json['data'].forEach((v) {
        _bookList!.add(BookModel.fromJson(v));
      });
    }
    _error = json['error'];
    _message = json['message'];
  }
}

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

  BookModel({
    required this.id,
    required this.title,
    required this.isbn,
    this.quantity,
    required this.edition,
    this.volume,
    this.issue,
    this.cover,
    this.is_pdf,
    this.url
  });

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
