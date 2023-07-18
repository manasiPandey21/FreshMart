import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocerybloc/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';

import '../../../../data/cart_items.dart';
import '../../../home/models/home_product_model.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    // TODO: implement event handler
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
    cartItems.remove(ProductDataModel);
  }
}
