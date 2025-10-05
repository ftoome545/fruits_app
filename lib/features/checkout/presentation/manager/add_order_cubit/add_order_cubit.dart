import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());
  final OrdersRepo ordersRepo;

  void addOrder({required OrderEntity order}) async {
    final result = await ordersRepo.addOrder(order: order);
    result.fold((failure) => emit(AddOrderFailure(errMessage: failure.message)),
        (success) => emit(AddOrderSuccess()));
  }
}
