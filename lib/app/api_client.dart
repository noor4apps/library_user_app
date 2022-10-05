import 'dart:developer';

import 'package:get/get.dart';
import 'package:library_user_app/utils/app_constants.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query}) async {
    try {
      Response response = await get(uri, headers: _mainHeaders, query: query);
      response = handleResponse(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      response = handleResponse(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(String uri) async {
    try {
      Response response = await delete(uri, headers: _mainHeaders);
      response = handleResponse(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Response handleResponse(Response response) {
    Response _response = response;

    if (_response.body != null && _response.body is! String) {
      if (_response.body.toString().startsWith('{errors: [{code:') && _response.body != null) {
        log('status: ${_response.statusCode} - errors: ${_response.body}');
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: "Error");
      }

      if (_response.body.toString().startsWith('{message') && _response.body != null) {
        log('status: ${_response.statusCode} - message: ${_response.body['message']}');
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _response.body['message']);
      }

      if (_response.body['error'] == 1 && _response.body != null) {
        showCustomSnackBar(message: _response.body['message']);
        log('status: ${_response.statusCode} - error: ${_response.body['error']} - message: ${_response.body['message']}');
      }
    } else if (_response.hasError && _response.body == null) {
      showCustomSnackBar(title: 'No internet connection', message: 'Please check your connection or try again later.');
      log('Connection to API server failed due to internet connection');
      _response = Response(statusCode: 0, statusText: 'Connection to API server failed due to internet connection');
    }

    return _response;
  }

}
