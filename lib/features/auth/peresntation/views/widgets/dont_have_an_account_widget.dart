import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

import '../../../../../core/utils/app_colors.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "لا تمتلك حساب؟",
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xFF949D9E),
              )),
          TextSpan(
              text: ' ',
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xFF616A6B),
              )),
          TextSpan(
              text: "قم بإنشاء حساب",
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.primaryColor,
              )),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
