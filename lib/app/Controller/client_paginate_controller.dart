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

  Future<void> getClientPaginateList() async {
    Response response = await clientPaginateRepo.getClientPaginateResponse();
    if (response.statusCode == 200) {
      clientPaginateList.clear();
      clientPaginateList.addAll(BookPaginate.fromJson(response.body).bookList!);
      _isLoading = true;
      update();
    } else if (response.isOk == false) {
      showCustomSnackBar(message: 'Server not found');
      print('Server not found');
    } else if (response.statusCode == 500) {
      showCustomSnackBar(message: '500 Internal Server Error');
      print('500 Internal Server Error');
    } else {
      showCustomSnackBar(message: '${BookPaginate.fromJson(response.body).message}');
      print('error: ${BookPaginate.fromJson(response.body).error}');
      print('message: ${BookPaginate.fromJson(response.body).message}');
    }
  }
}
