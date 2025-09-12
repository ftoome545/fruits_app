import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex});
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getItem().length, (index) {
        return Expanded(
          child: StepItem(
            text: getItem()[index],
            index: (index + 1).toString(),
            isActive: index <= currentPageIndex,
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
