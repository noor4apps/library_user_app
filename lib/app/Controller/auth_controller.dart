import 'package:get/get.dart';
import 'package:library_user_app/app/Model/response_model.dart';
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
        responseModel = ResponseModel(error: response.body['error'], message:  response.body['message']);
    } else {
      responseModel = ResponseModel(error: response.body['error'], message:  response.body['message']);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserTokenAddUpdateHeader(response.body['data']['token']);
      print('response.body ${response.body}');
      responseModel = ResponseModel(error: response.body['error'], message: response.body['message']);
    } else {
      responseModel = ResponseModel(error: response.body['error'], message: response.body['message']);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserPhoneAndPassword(String email, String password) {
    authRepo.saveUserEmailAndPassword(email, password);
  }

}