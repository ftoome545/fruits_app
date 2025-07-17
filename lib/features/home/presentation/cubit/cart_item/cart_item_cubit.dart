import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void cartItemUpdate(CartItemEntity cartItem) {
    emit(CartItemUpdated(cartItem));
  }
}
