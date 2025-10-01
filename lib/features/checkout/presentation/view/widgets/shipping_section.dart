import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 33,
          ),
          ShippingItem(
            onTap: () {
              isSelected = 0;
              setState(() {});
              orderEntity.payWithCash = true;
            },
            titel: 'الدفع عند الاستلام',
            subTitel: 'التسليم من المكان',
            price:
                (orderEntity.cartEntity.calculateTotalPrice() + 30).toString(),
            isSelected: isSelected == 0,
          ),
          const SizedBox(
            height: 8,
          ),
          ShippingItem(
            onTap: () {
              isSelected = 1;
              setState(() {});
              orderEntity.payWithCash = false;
            },
            titel: 'الدفع أونلاين',
            subTitel: 'يرجي تحديد طريقه الدفع',
            price: orderEntity.cartEntity.calculateTotalPrice().toString(),
            isSelected: isSelected == 1,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
