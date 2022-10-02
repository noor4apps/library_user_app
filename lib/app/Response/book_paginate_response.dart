import 'package:library_user_app/app/Model/book_model.dart';

class BookPaginateResponse {
  List<BookModel>? _bookList;
  int? _error;
  String? _message;

  int? _lastPage;

  List<BookModel>? get bookList => _bookList;

  int? get error => _error;

  String? get message => _message;

  int? get lastPage => _lastPage;

  BookPaginateResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _bookList = [];
      json['data']['data'].forEach((v) {
        _bookList!.add(BookModel.fromJson(v));
      });
    }
    if (json['data'] != null) {
      _lastPage = json['data']['meta']['last_page'];
    }
    _error = json['error'];
    _message = json['message'];
  }
}
