import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/active_bottom_navigation_bar_item.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/in_active_bottom_navigation_bar_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveBottomNavigationBarItem(
            image: bottomNavigationBarEntity.activeItem,
            text: bottomNavigationBarEntity.name)
        : InActiveBottomNavigationBarItemItem(
            image: bottomNavigationBarEntity.inActiveItem);
  }
}
