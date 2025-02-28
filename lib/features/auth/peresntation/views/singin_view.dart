import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/peresntation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/signin_view_body.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
          appBar: buildAppBar(context: context, title: "تسجيل الدخول"),
          body: const SigninViewBody()),
    );
  }
}
