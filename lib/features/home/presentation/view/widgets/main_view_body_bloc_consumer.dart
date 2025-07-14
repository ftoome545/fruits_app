import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        buildErrorBar(context, 'تمت العملية بنجاح');
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
