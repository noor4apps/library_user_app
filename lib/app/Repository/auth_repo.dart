import 'package:get/get.dart';
import 'package:library_user_app/app/Model/signin_body_model.dart';
import 'package:library_user_app/app/Model/signup_body_model.dart';
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

  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.EMAIL, email);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? '';
  }
}
