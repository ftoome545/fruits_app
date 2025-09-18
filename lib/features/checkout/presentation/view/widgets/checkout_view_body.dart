import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/checkout_page_view.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/checkout_steps.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          CheckoutSteps(
            currentPageIndex: currentPage,
            pageController: pageController,
          ),
          CheckoutPageView(pageController: pageController),
          CustomButton(
              onPressed: () {
                pageController.animateToPage(currentPage + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              text: getNextButtomTitle(currentPage)),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  String getNextButtomTitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }
}
