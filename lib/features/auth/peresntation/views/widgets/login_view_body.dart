import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/social_login_button.dart';

import 'dont_have_an_account_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "تسجيل الدخول"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const CustomTextFormField(
                hintText: "البريد الإلكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Color(0xFFC9CECF),
                  ),
                  hintText: "كلمة المرور",
                  textInputType: TextInputType.visiblePassword),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(onPressed: () {}, text: "تسجيل الدخول"),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  image: Assets.imagesGoogleIcon,
                  label: "تسجيل بواسطة جوجل",
                  onPressed: () {}),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  image: Assets.imagesAppleIcon,
                  label: "تسجيل بواسطة أبل",
                  onPressed: () {}),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  image: Assets.imagesFacebookIcon,
                  label: "تسجيل بواسطة فيسبوك",
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
