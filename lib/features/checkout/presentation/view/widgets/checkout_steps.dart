import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});
  final int currentPageIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getItem().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else {
                showErrorBar(context, 'اختر طريقة الدفع');
              }
            },
            child: StepItem(
              text: getItem()[index],
              index: (index + 1).toString(),
              isActive: index <= currentPageIndex,
            ),
          ),
        );
      }),
    );
  }
}

List<String> getItem() {
  return [
    'الشحن',
    'العنوان',
    'الدفع',
  ];
}
