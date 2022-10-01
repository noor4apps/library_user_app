import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/app/Controller/auth_controller.dart';
import 'package:library_user_app/app/Model/signin_body_model.dart';
import 'package:library_user_app/helper/route_helper.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';
import 'package:library_user_app/view/widget/app_text_field.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar(title: 'Your email', message: 'Type in your email');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar(title: 'Valid email', message: 'Type in valid email');
      } else if (password.isEmpty) {
        showCustomSnackBar(title: 'Password', message: 'Type in your password');
      } else if (password.length < 8) {
        showCustomSnackBar(title: 'Password length', message: 'Password can not be less than 8 characters');
      } else {

        SignInBodyModel signInBodyModel = SignInBodyModel(email: email, password: password);

        authController.login(signInBodyModel).then((responseModel) {
          if (responseModel.error == 0) {
            Get.offNamed(RouteHelper.getInitial());
            showCustomSnackBar(title: 'Success',message: responseModel.message, isError: false);
          } else {
            showCustomSnackBar(message: responseModel.message);
          }
        });

      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController) {
        return !_authController.isLoading
            ?
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight * 0.25),
              // welcome
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello', style: TextStyle(fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2, fontWeight: FontWeight.bold)),
                    Text('Sign in to your account', style: TextStyle(fontSize: Dimensions.font20, color: Colors.grey[500])),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),

              // email
              AppTextField(
                textEditingController: emailController,
                hintText: 'Email',
                icon: Icons.mobile_friendly,
              ),
              SizedBox(height: Dimensions.height20),

              // password
              AppTextField(
                isObscure: true,
                textEditingController: passwordController,
                hintText: 'Password',
                icon: Icons.password,
              ),
              SizedBox(height: Dimensions.height20),

              // sign in button
              GestureDetector(
                onTap: () {
                  _login(_authController);
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.iconPrimary,
                  ),
                  child: Center(
                    child: Text('Sign in', style: TextStyle(fontSize: Dimensions.font26, color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight * 0.05),

              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(color: Colors.grey[500], fontSize: Dimensions.font20),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Get.toNamed(RouteHelper.getRegister());
                      },
                      text: ' Create',
                      style: TextStyle(color: AppColors.textPrimary, fontSize: Dimensions.font20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.screenHeight * 0.05),
            ],
          ),
        )
            :
            CustomScrollView();
      })
    );
  }
}
