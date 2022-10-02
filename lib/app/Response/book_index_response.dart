import 'package:library_user_app/app/Model/book_model.dart';

class BookIndexResponse {
  List<BookModel>? _bookList;
  int? _error;
  String? _message;

  List<BookModel>? get bookList => _bookList;

  int? get error => _error;

  String? get message => _message;

  BookIndexResponse.fromJson(Map<String, dynamic> json) {
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
