import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_user_app/utils/dimensions.dart';

void showCustomSnackBar({String title = 'Error', required String message, bool isError = true}) {
  Get.snackbar(
    title,
    message,
    titleText: Text(title, style: TextStyle(fontSize: Dimensions.font16, fontWeight: FontWeight.bold ,color: Colors.white)),
    messageText: Text(message, style: const TextStyle(color: Colors.white)),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: isError ? Colors.redAccent : Colors.greenAccent,
  );
}