import 'package:get/get.dart';
import 'package:library_user_app/app/Controller/auth_controller.dart';
import 'package:library_user_app/app/Controller/client_index_controller.dart';
import 'package:library_user_app/app/Controller/client_paginate_controller.dart';
import 'package:library_user_app/app/Repository/auth_repo.dart';
import 'package:library_user_app/app/Repository/client_index_repo.dart';
import 'package:library_user_app/app/Repository/client_paginate_repo.dart';
import 'package:library_user_app/app/api_client.dart';
import 'package:library_user_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // Repos
  Get.lazyPut(() => ClientIndexRepo(apiClient: Get.find()));
  Get.lazyPut(() => ClientPaginateRepo(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // Controller
  Get.lazyPut(() => ClientIndexController(clientIndexRepo: Get.find()));
  Get.lazyPut(() => ClientPaginateController(clientPaginateRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}
