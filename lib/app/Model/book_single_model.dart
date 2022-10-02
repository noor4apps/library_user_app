import 'package:library_user_app/app/Model/author_model.dart';
import 'package:library_user_app/app/Model/category_model.dart';

class BookSingle {
  BookSingleModel? _bookSingle;
  int? _error;
  String? _message;

  BookSingleModel? get bookSingle => _bookSingle;

  int? get error => _error;

  String? get message => _message;

  BookSingle.fromJson(Map<String, dynamic> json) {
    _bookSingle = BookSingleModel.fromJson(json['data']);
    _error = json['error'];
    _message = json['message'];
  }
}

class BookSingleModel {
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

  List<AuthorModel>? authors = [];
  List<CategoryModel>? categories = [];

  BookSingleModel.fromJson(Map<String, dynamic> json) {
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

    json['authors'].forEach((e) => authors?.add(AuthorModel.fromJson(e)));
    json['categories'].forEach((e) => categories?.add(CategoryModel.fromJson(e)));
  }
}
