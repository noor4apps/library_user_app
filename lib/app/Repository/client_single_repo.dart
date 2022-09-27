import 'package:get/get.dart';
import 'package:library_user_app/app/api_client.dart';
import 'package:library_user_app/utils/app_constants.dart';

class ClientSingleRepo {
  final ApiClient apiClient;

  ClientSingleRepo({required this.apiClient});

  Future<Response> getClientSingleResponse(int bookId) async {
    return await apiClient.getData(AppConstants.CLIENT_SINGLE_URL + bookId.toString());
  }
}
