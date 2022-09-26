import 'package:get/get.dart';
import 'package:library_user_app/app/api_client.dart';
import 'package:library_user_app/utils/app_constants.dart';

class ClientOrderRepo {
  final ApiClient apiClient;

  ClientOrderRepo({required this.apiClient});

  Future<Response> getClientOrderResponse() async {
    return await apiClient.getData(AppConstants.CLIENT_ORDERS_URI);
  }

  Future<Response> addOrderResponse(int bookId) async {
    return await apiClient.postData(AppConstants.CLIENT_ADD_ORDERS_URI + bookId.toString(), {});
  }

  Future<Response> destroyOrderResponse(int bookId) async {
    return await apiClient.deleteData(AppConstants.CLIENT_DESTROY_ORDERS_URI + bookId.toString());
  }
}
