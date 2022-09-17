import 'package:get/get.dart';
import 'package:library_user_app/app/Controller/client_index_controller.dart';
import 'package:library_user_app/app/Repository/client_index_repo.dart';
import 'package:library_user_app/app/api_client.dart';
import 'package:library_user_app/utils/app_constants.dart';

Future<void> init() async {

  // Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // Repos
  Get.lazyPut(() => ClientIndexRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => ClientIndexController(clientIndexRepo: Get.find()));
}
