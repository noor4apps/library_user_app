import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';
import 'package:library_user_app/view/widget/app_text_field.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var contactNumberController = TextEditingController();
    var addressController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordConfirmationController = TextEditingController();

    void _registration(authController) {
      String firstName = firstNameController.text.trim();
      String lastName = lastNameController.text.trim();
      String contactNumber = contactNumberController.text.trim();
      String address = addressController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String passwordConfirmation = passwordController.text.trim();

      if (firstName.isEmpty) {
        showCustomSnackBar(title: 'First Name', message: 'Type in your first name');
      } else if (lastName.isEmpty) {
        showCustomSnackBar(title: 'Last Name', message: 'Type in your last name');
      } else if (contactNumber.isEmpty) {
        showCustomSnackBar(title: 'Contact Number', message: 'Type in your phone number');
      } else if (email.isEmpty) {
        showCustomSnackBar(title: 'Email address', message: 'Type in your email address');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar(title: 'Valid Email address', message: 'Type in a valid email address');
      } else if (password.isEmpty) {
        showCustomSnackBar(title: 'Password', message: 'Type in your password');
      } else if (password.length < 8) {
        showCustomSnackBar(title: 'Password', message: 'Password can not be less than 8 character');
      } else if (passwordConfirmation.isEmpty) {
        showCustomSnackBar(title: 'Password confirmation', message: 'Type in your confirm password');
      } else if (password != passwordConfirmation) {
        showCustomSnackBar(title: 'Password confirmation', message: 'The password confirmation does not match.');
      } else {
        // SignUpBody signUpBody = SignUpBody(name: name, phone: phone, email: email, password: password);

        authController.registration().then((status) {
          if(status.isSuccess) {
            // Get.offNamed();
          } else {
            showCustomSnackBar(message: status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: AppColors.bg,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.height20),
              Container(
                height: Get.height / 8,
                color: AppColors.bg,
                child: Stack(
                  children: [
                    Center(
                        child: Text('Let\'s do something special...', style: TextStyle(fontSize: Dimensions.font20, color: AppColors.textPrimary))),
                    IconButton(
                      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back, size: 30),
                    )
                  ],
                ),
              ),
              // First Name
              AppTextField(
                  textEditingController: firstNameController,
                  hintText: 'First Name',
                  icon: Icons.person,
              ),
              SizedBox(height: Dimensions.height20),
              // Last Name
              AppTextField(
                  textEditingController: lastNameController,
                  hintText: 'Last Name',
                  icon: Icons.person_pin_outlined,
              ),
              SizedBox(height: Dimensions.height20),

              // Contact Number
              AppTextField(
                  textEditingController: contactNumberController,
                  hintText: 'Contact Number',
                  icon: Icons.phone,
              ),
              SizedBox(height: Dimensions.height20),

              // Address
              AppTextField(
                  textEditingController: addressController,
                  hintText: 'Address',
                  icon: Icons.add_location,
              ),
              SizedBox(height: Dimensions.height20),

              // Email
              AppTextField(
                  textEditingController: emailController,
                  hintText: 'Email',
                  icon: Icons.email,
              ),
              SizedBox(height: Dimensions.height20),

              // Password
              AppTextField(
                  isObscure: true,
                  textEditingController: passwordController,
                  hintText: 'Password',
                  icon: Icons.password,
              ),
              SizedBox(height: Dimensions.height20),

              // Confirm Password
              AppTextField(
                  isObscure: true,
                  textEditingController: passwordConfirmationController,
                  hintText: 'Confirm Password',
                  icon: Icons.password,
              ),
              SizedBox(height: Dimensions.height20),

              // sign up button
              GestureDetector(
                onTap: () {
                  _registration(true);
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.iconPrimary,
                  ),
                  child: Center(child: Text('Sign up', style: TextStyle(fontSize: Dimensions.font26, color: Colors.white))),
                ),
              ),
              SizedBox(height: Dimensions.height10),
              // have an account
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: 'Have an account already?',
                  style: TextStyle(color: Colors.grey[500], fontSize: Dimensions.font20),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight * 0.09),
            ],
          ),
        )

        // CustomLoader();
        );
  }
}
