import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/in_active_step_item.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'العنوان'),
      body: const Column(
        children: [ActiveStepItem(), InActiveStepItem()],
      ),
    );
  }
}
