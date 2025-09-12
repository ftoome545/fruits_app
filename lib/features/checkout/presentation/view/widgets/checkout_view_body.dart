import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
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
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'العنوان'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            CheckoutSteps(
              currentPageIndex: currentPageIndex,
            ),
            CheckoutPageView(pageController: pageController),
            CustomButton(
                onPressed: () {
                  pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                text: 'التالي'),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
