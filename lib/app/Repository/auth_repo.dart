import 'dart:convert';

import 'package:get/get.dart';
import 'package:library_user_app/app/Model/signup_body_model.dart';
import 'package:library_user_app/app/Model/user_model.dart';
import 'package:library_user_app/app/api_client.dart';
import 'package:library_user_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUpBodyModel signUpBodyModel) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBodyModel.toJson());
  }

  Future<bool> saveUserTokenAddUpdateHeader(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<Response> login(SignInBodyModel) async {
    return await apiClient.postData(AppConstants.LOGIN_URI, SignInBodyModel.toJson());
  }

  Future<Response> logout() async {
    return await apiClient.getData(AppConstants.LOGOUT_URI);
  }

  Future<bool> saveUser(Map userModel) async {
    return await sharedPreferences.setString(AppConstants.USER, jsonEncode(userModel));
  }

  UserModel getUser() {
    String? user = sharedPreferences.getString(AppConstants.USER);
    return UserModel.fromJson(jsonDecode(user!));
  }

  Future<bool> clearUser() async {
    await sharedPreferences.remove(AppConstants.USER);
    return true;
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? '';
  }

  bool isUserLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<bool> clearUserTokenAndResetHeader() async {
    await sharedPreferences.remove(AppConstants.TOKEN);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
