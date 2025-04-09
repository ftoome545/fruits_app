import 'package:fruits_hub/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeItem, inActiveItem;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeItem,
      required this.inActiveItem,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarEntity => [
      BottomNavigationBarEntity(
          activeItem: Assets.imagesHomeBold,
          inActiveItem: Assets.imagesHomeOutline,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeItem: Assets.imagesProductBold,
          inActiveItem: Assets.imagesProductOutline,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeItem: Assets.imagesShoppingCartBold,
          inActiveItem: Assets.imagesShoppingCartOutline,
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeItem: Assets.imagesUserBold,
          inActiveItem: Assets.imagesUserOutline,
          name: 'حسابي'),
    ];
