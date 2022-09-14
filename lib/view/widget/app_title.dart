import 'package:flutter/material.dart';
import 'package:library_user_app/utils/colors.dart';
import 'package:library_user_app/utils/dimensions.dart';

class AppTitle extends StatelessWidget {
  final String word1, word2;
  const AppTitle(this.word1, this.word2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(word1, style: TextStyle(fontSize: Dimensions.font20, color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        SizedBox(width: Dimensions.width10),
        Text(word2, style: TextStyle(fontSize: Dimensions.font20, color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
