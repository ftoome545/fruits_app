import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/core/helper_functions/app_keys.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/checkout_page_view.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/checkout_steps.dart';

import '../../../domain/entities/paypal_payment/paypal_payment.dart';
import '../../manager/add_order_cubit/add_order_cubit.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
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
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPage = 0;
  final GlobalKey<FormState> _formKey = GlobalKey();

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
            onTap: (index) {
              if (currentPage == 0) {
                var orderEntity = context.read<OrderEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  showErrorBar(context, 'اختر طريقة الدفع');
                }
              } else if (index == 1) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else {
                _handleAddressValidation();
              }
            },
          ),
          CheckoutPageView(
            pageController: pageController,
            formKey: _formKey,
            valueListenable: valueNotifier,
          ),
          CustomButton(
              onPressed: () {
                if (currentPage == 0) {
                  _handleShippingSectionValidation(context);
                } else if (currentPage == 1) {
                  _handleAddressValidation();
                } else {
                  _processPayment(context);
                }
              },
              text: getNextButtomTitle(currentPage)),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    log(paypalPaymentEntity.toJson().toString());
    var addOrderEntity = context.read<AddOrderCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: kPaypalClientId,
        secretKey: kPaypalSecretKey,
        transactions: [
          paypalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pop(context);
          addOrderEntity.addOrder(order: orderEntity);
        },
        onError: (error) {
          Navigator.pop(context);
          log(error.toString());
          showErrorBar(context, 'فشلت عملية الدفع');
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      showErrorBar(context, 'اختر طريقة الدفع');
    }
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

  void _handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }
}
