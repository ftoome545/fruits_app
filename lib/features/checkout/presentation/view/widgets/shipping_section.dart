import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
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
            },
            titel: 'الدفع عند الاستلام',
            subTitel: 'التسليم من المكان',
            price: '40',
            isSelected: isSelected == 0,
          ),
          const SizedBox(
            height: 8,
          ),
          ShippingItem(
            onTap: () {
              isSelected = 1;
              setState(() {});
            },
            titel: 'الدفع أونلاين',
            subTitel: 'يرجي تحديد طريقه الدفع',
            price: '40',
            isSelected: isSelected == 1,
          ),
        ],
      ),
    );
  }
}
