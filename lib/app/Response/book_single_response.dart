import 'package:library_user_app/app/Model/book_single_model.dart';

class BookSingleResponse {
  BookSingleModel? _bookSingle;
  int? _error;
  String? _message;

  BookSingleModel? get bookSingle => _bookSingle;

  int? get error => _error;

  String? get message => _message;

  BookSingleResponse.fromJson(Map<String, dynamic> json) {
    _bookSingle = BookSingleModel.fromJson(json['data']);
    _error = json['error'];
    _message = json['message'];
  }
}
