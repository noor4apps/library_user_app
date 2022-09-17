import 'package:get/get.dart';
import 'package:library_user_app/app/api_client.dart';
import 'package:library_user_app/utils/app_constants.dart';

class ClientIndexRepo extends GetxService {
  final ApiClient apiClient;

  ClientIndexRepo({required this.apiClient});

  Future<Response> getClientIndexResponse() async {
    return await apiClient.getData(AppConstants.CLIENT_INDEX_URL);
  }
}
