import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/app/Repository/client_paginate_repo.dart';
import 'package:library_user_app/app/Response/book_paginate_response.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';

class ClientPaginateController extends GetxController implements GetxService {
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
      clientPaginateList.addAll(BookPaginateResponse.fromJson(response.body).bookList!);

      lastPage = BookPaginateResponse.fromJson(response.body).lastPage!;

      _isLoading = false;
      isLoadingPagination = false;
      update();
    }  else if (response.statusCode == 500) {
      showCustomSnackBar(message: '500 Internal Server Error');
      print('500 Internal Server Error');
    } else {
      showCustomSnackBar(message: '${BookPaginateResponse.fromJson(response.body).message}');
      print('error: ${BookPaginateResponse.fromJson(response.body).error}');
      print('message: ${BookPaginateResponse.fromJson(response.body).message}');
    }
  }

  final scrollController = ScrollController();

  @override
  void onInit() {

    this.getClientPaginateList();

    scrollController.addListener(() {
      var sControllerOffset = scrollController.offset;
      var sControllerMax = scrollController.position.maxScrollExtent - 100;
      var isLoadingPagination = this.isLoadingPagination;
      var hasMorePages = this.currentPage < this.lastPage;

      if (sControllerOffset > sControllerMax && isLoadingPagination == false && hasMorePages) {
        this.isLoadingPagination = true;
        this.currentPage++;

        this.getClientPaginateList(page: this.currentPage);
      }
    });

    super.onInit();
  }
}
