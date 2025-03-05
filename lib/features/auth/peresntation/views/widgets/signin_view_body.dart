import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/peresntation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/social_login_button.dart';

import 'dont_have_an_account_widget.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;

  final GlobalKey<FormState> formKay = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKay,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: "البريد الإلكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
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
              CustomButton(
                  onPressed: () {
                    if (formKay.currentState!.validate()) {
                      formKay.currentState!.save();
                      context.read<SigninCubit>().signInWithEmailAndPassword(
                          email: email, password: password);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: "تسجيل الدخول"),
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
                  onPressed: () {
                    context.read<SigninCubit>().authRepo.signInWithGoogle();
                  }),
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
                  onPressed: () {
                    context.read<SigninCubit>().authRepo.signInFacebook();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
