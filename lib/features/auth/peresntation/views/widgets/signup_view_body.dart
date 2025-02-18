import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/peresntation/signup_cubits/signup_cubit.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    userName = value!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xFFC9CECF),
                  ),
                  hintText: 'كلمة المرور',
                  textInputType: TextInputType.visiblePassword),
              const SizedBox(
                height: 16,
              ),
              const TermsAndConditions(),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                              email: email, password: password, name: userName);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                  text: 'تسجيل جديد'),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
