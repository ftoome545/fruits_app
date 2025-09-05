import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getItem().length, (index) {
        return Expanded(
          child: StepItem(
            text: getItem()[index],
            index: (index + 1).toString(),
            isActive: false,
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
    'المراجعة',
  ];
}
