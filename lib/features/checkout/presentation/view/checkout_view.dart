import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/view/add_order_cubit_bloc_builder.dart';
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
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrdersRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'العنوان'),
        body: Provider.value(
            value: orderEntity,
            child: const AddOrderCubitBlocBuilder(child: CheckoutViewBody())),
      ),
    );
  }
}
