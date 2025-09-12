import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/address_input_section.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/payment_section.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/shipping_section.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getView().length,
        itemBuilder: (context, index) {
          return getView()[index];
        },
      ),
    );
  }

  List<Widget> getView() {
    return const [
      ShippingSection(),
      AddressInputSection(),
      PaymentSection(),
    ];
  }
}
