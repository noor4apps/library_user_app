import 'package:get/get.dart';
import 'package:library_user_app/app/Model/book_model.dart';
import 'package:library_user_app/app/Repository/client_paginate_repo.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';

class ClientPaginateController extends GetxController {
  final ClientPaginateRepo clientPaginateRepo;

  ClientPaginateController({required this.clientPaginateRepo});

  List<dynamic> _clientPaginateList = [];

  bool _isLoading = false;

  List<dynamic> get clientPaginateList => _clientPaginateList;

  bool get isLoading => _isLoading;

  bool isLoadingPagination = false;
  int currentPage = 1;
  int lastPage = 1;

  Future<void> getClientPaginateList({int page = 1}) async {
    Response response = await clientPaginateRepo.getClientPaginateResponse(page: page);
    if (response.statusCode == 200) {
      if (page == 1) {
        clientPaginateList.clear();
        _isLoading = true;
        currentPage = 1;
        update();
      }
      clientPaginateList.addAll(BookPaginate.fromJson(response.body).bookList!);

      lastPage = BookPaginate.fromJson(response.body).lastPage!;

      _isLoading = false;
      isLoadingPagination = false;
      update();
    }  else if (response.statusCode == 500) {
      showCustomSnackBar(message: '500 Internal Server Error');
      print('500 Internal Server Error');
    } else {
      showCustomSnackBar(message: '${BookPaginate.fromJson(response.body).message}');
      print('error: ${BookPaginate.fromJson(response.body).error}');
      print('message: ${BookPaginate.fromJson(response.body).message}');
    }
  }
}
