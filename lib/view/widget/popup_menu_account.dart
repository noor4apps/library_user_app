import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/app/Controller/auth_controller.dart';
import 'package:library_user_app/helper/route_helper.dart';
import 'package:library_user_app/view/widget/show_custom_snackbar.dart';

class PopupMenuAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    var isLogin = authController.isUserLoggedIn();

    return PopupMenuButton(
      icon: const Icon(Icons.person_outline),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        // MY ACCOUNT
        PopupMenuItem(child: Text('MY ACCOUNT ${isLogin ? authController.getUserFullName() : ""}')),
        // Divider
        PopupMenuDivider(),
        if(!isLogin)
        // Login
          PopupMenuItem(
          child: GestureDetector(
            child: Text('Login'),
            onTap: () {
              Get.toNamed(RouteHelper.getLogin());
            },
          ),
        ),
        if(!isLogin)
        // Register
          PopupMenuItem(
          child: GestureDetector(
            child: Text('Register'),
            onTap: () {
              Get.toNamed(RouteHelper.getRegister());
            },
          ),
        ),
        if(isLogin)
        // My order
          PopupMenuItem(
            child: GestureDetector(
              child: Text('My order'),
              onTap: () {
                Get.toNamed(RouteHelper.getMyOrder());
              },
            ),
          ),
        if(isLogin)
        // Logout
        PopupMenuItem(
          child: GestureDetector(
            child: Text('Logout'),
            onTap: () {

              Get.find<AuthController>().logout().then((value) {
                if(value.error == 0) {
                  showCustomSnackBar(title: 'Success',message: value.message!, isError: false);
                  Get.offAndToNamed(RouteHelper.getInitial());
                } else {
                  showCustomSnackBar(message: value.message!);
                }
              });

            },
          ),
        ),

      ],
    );
  }

}