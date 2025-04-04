import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/peresntation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/signup_view_body.dart';
import '../../../../../core/helper_functions/build_error_bar.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.of(context).pop();
        }
        if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SignupLoading ? true : false,
            child: const SignUpViewBody());
      },
    );
  }
}
