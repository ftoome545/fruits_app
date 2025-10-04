import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/checkout_view_body.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    super.initState();
    orderEntity =
        OrderEntity(cartEntity: widget.cartEntity, uId: getUser().uId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'العنوان'),
      body: Provider.value(value: orderEntity, child: const CheckoutViewBody()),
    );
  }
}
