import 'package:get/get.dart';
import 'package:library_user_app/app/api_client.dart';
import 'package:library_user_app/utils/app_constants.dart';

class ClientPaginateRepo extends GetxService {
  final ApiClient apiClient;

  ClientPaginateRepo({required this.apiClient});

  Future<Response> getClientPaginateResponse({int page = 1}) async {
    return await apiClient.getData(AppConstants.CLIENT_PAGINATE_URL, query: {'page': page.toString()});
  }
}
