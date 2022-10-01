import 'package:get/get.dart';
import 'package:library_user_app/app/Model/response_model.dart';
import 'package:library_user_app/app/Model/signin_body_model.dart';
import 'package:library_user_app/app/Model/signup_body_model.dart';
import 'package:library_user_app/app/Repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBodyModel signUpBodyModel) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBodyModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
        authRepo.saveUserTokenAddUpdateHeader(response.body['data']['token']);
        authRepo.saveUser(response.body['data']['user']);
        responseModel = ResponseModel(error: response.body['error'], message:  response.body['message']);
    } else {
      responseModel = ResponseModel(error: response.body['error'], message:  response.body['message']);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(SignInBodyModel signInBodyModel) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(signInBodyModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserTokenAddUpdateHeader(response.body['data']['token']);
      authRepo.saveUser(response.body['data']['user']);
      responseModel = ResponseModel(error: response.body['error'], message: response.body['message']);
    } else {
      responseModel = ResponseModel(error: response.body['error'], message: response.body['message']);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> logout() async {
    _isLoading = true;
    update();
    Response response = await authRepo.logout();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(error: response.body['error'], message: response.body['message']);
      authRepo.clearUserTokenAndResetHeader();
      authRepo.clearUser();
    } else {
      responseModel = ResponseModel(error: response.body['error'], message: response.body['message']);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  bool isUserLoggedIn() {
    return authRepo.isUserLoggedIn();
  }

  String? getUserFullName() {
      return authRepo.getUser().full_name?.toUpperCase();
  }

}