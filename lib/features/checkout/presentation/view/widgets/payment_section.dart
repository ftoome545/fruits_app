import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/order_summery_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return OrderSummeryWidget(
      pageController: pageController,
    );
  }
}
